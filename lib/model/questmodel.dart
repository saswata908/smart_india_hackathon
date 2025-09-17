import 'package:farmify_app/model/objective.dart';

class Quest {
  final String name;
  final List<Objective> objectives;
  final String photo;
  final String badge;
  final int rewardPoints;
  final String eligibility;
  final String redeemInstructions;
  int progress; // mutable now

  Quest({
    required this.name,
    required this.objectives,
    required this.photo,
    required this.badge,
    required this.rewardPoints,
    required this.eligibility,
    required this.redeemInstructions,
    this.progress = 0,
  });

  /// Recalculate progress when objectives are updated
  void updateProgress() {
    int completed = objectives.where((o) => o.isCompleted).length;
    progress = ((completed / objectives.length) * 100).round();
  }
}
