class Objective {
  final String description;
  bool isCompleted;

  Objective({required this.description, this.isCompleted = false});

  // Copy constructor for immutable updates if needed
  Objective copyWith({String? description, bool? isCompleted}) {
    return Objective(
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {'description': description, 'isCompleted': isCompleted};
  }

  // Create from JSON
  factory Objective.fromJson(Map<String, dynamic> json) {
    return Objective(
      description: json['description'],
      isCompleted: json['isCompleted'] ?? false,
    );
  }
}
