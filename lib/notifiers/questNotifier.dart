// questnotifier.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:farmify_app/model/questmodel.dart';
import 'package:farmify_app/model/objective.dart';
import 'package:farmify_app/data/questdata.dart';

class QuestNotifier extends StateNotifier<List<Quest>> {
  QuestNotifier() : super(quests);

  // Helper: find index by id or name (keeps backward compatibility with existing callers)
  int _indexOf(String questIdOrName) {
    return state.indexWhere(
      (q) => q.id == questIdOrName || q.name == questIdOrName,
    );
  }

  void updateObjectiveStatus(
    String questName,
    int objectiveIndex,
    bool isCompleted,
  ) {
    final idx = _indexOf(questName);
    if (idx == -1) return;

    final quest = state[idx];

    // Create new list of objectives with updated objective
    final updatedObjectives = List<Objective>.from(quest.objectives);
    if (objectiveIndex < 0 || objectiveIndex >= updatedObjectives.length)
      return;

    updatedObjectives[objectiveIndex] = updatedObjectives[objectiveIndex]
        .copyWith(isCompleted: isCompleted);

    // Create updated quest (progress is computed from objectives getter)
    final updatedQuest = quest.copyWith(objectives: updatedObjectives);

    // Replace state with a NEW list (important for Riverpod notifications)
    state = [
      for (var q in state)
        if (q.id == updatedQuest.id) updatedQuest else q,
    ];
  }

  Quest getQuestByName(String questName) {
    return state.firstWhere(
      (quest) => quest.id == questName || quest.name == questName,
      orElse: () => throw Exception('Quest not found: $questName'),
    );
  }

  /// Attempt to set quest progress by adjusting completed objectives.
  /// Because progress is derived from objectives, we mark a proportionate number
  /// of objectives as completed to match the requested progress.
  void updateQuestProgress(String questName, int newProgress) {
    final idx = _indexOf(questName);
    if (idx == -1) return;

    final quest = state[idx];
    final total = quest.objectives.length;
    if (total == 0) return;

    final clamped = newProgress.clamp(0, 100);
    final shouldCompleteCount = ((clamped / 100) * total).round();

    // Determine new objectives list: mark first N as completed, others not.
    // (You can change logic to prefer previously completed ones if desired.)
    final updatedObjectives = List<Objective>.from(quest.objectives);
    for (var i = 0; i < total; i++) {
      updatedObjectives[i] = updatedObjectives[i].copyWith(
        isCompleted: i < shouldCompleteCount,
      );
    }

    final updatedQuest = quest.copyWith(objectives: updatedObjectives);

    state = [
      for (var q in state)
        if (q.id == updatedQuest.id) updatedQuest else q,
    ];
  }

  void markQuestComplete(String questName) {
    final idx = _indexOf(questName);
    if (idx == -1) return;

    final quest = state[idx];
    final completedObjectives =
        quest.objectives.map((obj) => obj.copyWith(isCompleted: true)).toList();

    final updatedQuest = quest.copyWith(objectives: completedObjectives);

    state = [
      for (var q in state)
        if (q.id == updatedQuest.id) updatedQuest else q,
    ];
  }

  void resetQuest(String questName) {
    final idx = _indexOf(questName);
    if (idx == -1) return;

    final quest = state[idx];
    final resetObjectives =
        quest.objectives
            .map((obj) => obj.copyWith(isCompleted: false))
            .toList();

    final updatedQuest = quest.copyWith(objectives: resetObjectives);

    state = [
      for (var q in state)
        if (q.id == updatedQuest.id) updatedQuest else q,
    ];
  }
}

final questProvider = StateNotifierProvider<QuestNotifier, List<Quest>>((ref) {
  return QuestNotifier();
});
