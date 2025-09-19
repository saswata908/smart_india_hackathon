import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:farmify_app/model/questmodel.dart';
import 'package:farmify_app/model/objective.dart';
import 'package:farmify_app/data/questdata.dart';

class QuestNotifier extends StateNotifier<List<Quest>> {
  QuestNotifier() : super(quests);

  // Helper: find index by id or name (keeps backward compatibility with existing callers)
  int _indexOf(String questIdOrName) {
    final index = state.indexWhere(
      (q) => q.id == questIdOrName || q.name == questIdOrName,
    );
    print('Looking for quest: $questIdOrName, found at index: $index');
    if (index >= 0) {
      print('Found quest: ${state[index].name} with ID: ${state[index].id}');
    }
    return index;
  }

  void updateObjectiveStatus(
    String questIdOrName,
    int objectiveIndex,
    bool isCompleted,
  ) {
    print(
      'updateObjectiveStatus called with: questIdOrName=$questIdOrName, objectiveIndex=$objectiveIndex, isCompleted=$isCompleted',
    );

    final idx = _indexOf(questIdOrName);
    if (idx == -1) {
      print('ERROR: Quest not found: $questIdOrName');
      return;
    }

    final quest = state[idx];
    print(
      'Updating quest: ${quest.name}, current progress: ${quest.progress}%',
    );

    // Create new list of objectives with updated objective
    final updatedObjectives = List<Objective>.from(quest.objectives);
    if (objectiveIndex < 0 || objectiveIndex >= updatedObjectives.length) {
      print(
        'ERROR: Invalid objective index: $objectiveIndex (max: ${updatedObjectives.length - 1})',
      );
      return;
    }

    updatedObjectives[objectiveIndex] = updatedObjectives[objectiveIndex]
        .copyWith(isCompleted: isCompleted);

    // Create updated quest (progress is computed from objectives getter)
    final updatedQuest = quest.copyWith(objectives: updatedObjectives);
    print('New progress after update: ${updatedQuest.progress}%');

    // Replace state with a NEW list (important for Riverpod notifications)
    final newState = [
      for (var q in state)
        if (q.id == updatedQuest.id) updatedQuest else q,
    ];

    print(
      'Updating state. Old state hash: ${state.hashCode}, New state hash: ${newState.hashCode}',
    );
    state = newState;
    print('State updated successfully');
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
  void updateQuestProgress(String questIdOrName, int newProgress) {
    print(
      'updateQuestProgress called with: $questIdOrName, progress: $newProgress',
    );

    final idx = _indexOf(questIdOrName);
    if (idx == -1) {
      print('ERROR: Quest not found in updateQuestProgress: $questIdOrName');
      return;
    }

    final quest = state[idx];
    final total = quest.objectives.length;
    if (total == 0) {
      print('WARNING: Quest has no objectives: ${quest.name}');
      return;
    }

    final clamped = newProgress.clamp(0, 100);
    final shouldCompleteCount = ((clamped / 100) * total).round();

    print(
      'Updating ${quest.name}: completing $shouldCompleteCount out of $total objectives',
    );

    // Determine new objectives list: mark first N as completed, others not.
    final updatedObjectives = List<Objective>.from(quest.objectives);
    for (var i = 0; i < total; i++) {
      updatedObjectives[i] = updatedObjectives[i].copyWith(
        isCompleted: i < shouldCompleteCount,
      );
    }

    final updatedQuest = quest.copyWith(objectives: updatedObjectives);
    print(
      'Quest progress updated from ${quest.progress}% to ${updatedQuest.progress}%',
    );

    state = [
      for (var q in state)
        if (q.id == updatedQuest.id) updatedQuest else q,
    ];
    print('updateQuestProgress completed');
  }

  void markQuestComplete(String questIdOrName) {
    print('markQuestComplete called for: $questIdOrName');

    final idx = _indexOf(questIdOrName);
    if (idx == -1) {
      print('ERROR: Quest not found in markQuestComplete: $questIdOrName');
      return;
    }

    final quest = state[idx];
    final completedObjectives =
        quest.objectives.map((obj) => obj.copyWith(isCompleted: true)).toList();

    final updatedQuest = quest.copyWith(objectives: completedObjectives);
    print(
      'Marking quest complete: ${quest.name}, new progress: ${updatedQuest.progress}%',
    );

    state = [
      for (var q in state)
        if (q.id == updatedQuest.id) updatedQuest else q,
    ];
    print('Quest marked as complete');
  }

  void resetQuest(String questIdOrName) {
    print('resetQuest called for: $questIdOrName');

    final idx = _indexOf(questIdOrName);
    if (idx == -1) {
      print('ERROR: Quest not found in resetQuest: $questIdOrName');
      return;
    }

    final quest = state[idx];
    final resetObjectives =
        quest.objectives
            .map((obj) => obj.copyWith(isCompleted: false))
            .toList();

    final updatedQuest = quest.copyWith(objectives: resetObjectives);
    print(
      'Resetting quest: ${quest.name}, new progress: ${updatedQuest.progress}%',
    );

    state = [
      for (var q in state)
        if (q.id == updatedQuest.id) updatedQuest else q,
    ];
    print('Quest reset completed');
  }
}

final questProvider = StateNotifierProvider<QuestNotifier, List<Quest>>((ref) {
  return QuestNotifier();
});
