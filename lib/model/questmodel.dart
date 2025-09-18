// questmodel.dart
import 'package:farmify_app/model/objective.dart';

class Quest {
  final String id;
  final String name;
  final String description;
  final List<Objective> objectives;
  final String photo;
  final String badge;
  final int rewardPoints;
  final String eligibility;
  final String redeemInstructions;

  const Quest({
    required this.id,
    required this.name,
    required this.description,
    required this.objectives,
    required this.photo,
    required this.badge,
    required this.rewardPoints,
    required this.eligibility,
    required this.redeemInstructions,
  });

  /// Progress is computed from objectives (0..100)
  int get progress {
    if (objectives.isEmpty) return 0;
    final completed = objectives.where((o) => o.isCompleted).length;
    return ((completed / objectives.length) * 100).round();
  }

  /// Get the current progress as a double (0.0 to 1.0)
  double get progressRatio => progress / 100.0;

  /// Check if quest is completed
  bool get isCompleted => progress >= 100;

  /// Get number of completed objectives
  int get completedObjectivesCount =>
      objectives.where((o) => o.isCompleted).length;

  /// Immutable copyWith
  Quest copyWith({
    String? id,
    String? name,
    String? description,
    List<Objective>? objectives,
    String? photo,
    String? badge,
    int? rewardPoints,
    String? eligibility,
    String? redeemInstructions,
  }) {
    return Quest(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      objectives: objectives ?? this.objectives,
      photo: photo ?? this.photo,
      badge: badge ?? this.badge,
      rewardPoints: rewardPoints ?? this.rewardPoints,
      eligibility: eligibility ?? this.eligibility,
      redeemInstructions: redeemInstructions ?? this.redeemInstructions,
    );
  }

  /// Convert to JSON (includes computed progress for convenience)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'objectives': objectives.map((obj) => obj.toJson()).toList(),
      'photo': photo,
      'badge': badge,
      'rewardPoints': rewardPoints,
      'eligibility': eligibility,
      'redeemInstructions': redeemInstructions,
      'progress': progress,
    };
  }

  /// Create from JSON. If 'id' is absent, fallback to name (not ideal but backwards-compatible).
  factory Quest.fromJson(Map<String, dynamic> json) {
    return Quest(
      id: json['id']?.toString() ?? (json['name']?.toString() ?? ''),
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      objectives:
          (json['objectives'] as List? ?? [])
              .map((obj) => Objective.fromJson(obj as Map<String, dynamic>))
              .toList(),
      photo: json['photo'] ?? '',
      badge: json['badge'] ?? '',
      rewardPoints: json['rewardPoints'] ?? 0,
      eligibility: json['eligibility'] ?? '',
      redeemInstructions: json['redeemInstructions'] ?? '',
    );
  }
}
