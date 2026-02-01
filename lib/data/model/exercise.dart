class Exercise {

  final int exerciseId;
  final String name;
  final String notes;
  final String iconPath;

  const Exercise({
    required this.exerciseId,
    required this.name,
    required this.notes,
    required this.iconPath});

  Map<String, Object?> toMap(){
    return {'exerciseId': exerciseId, 'name': name, 'notes': notes, 'iconPath': iconPath};
  }

  @override
  String toString() {
    return 'Exercise{id: $exerciseId, name: $name, notes: $notes, iconPath: $iconPath}';
  }

  factory Exercise.fromMap(Map<String, dynamic> map) {
    return Exercise(
      exerciseId:  map['exerciseId'],
      name: map['name'],
      notes: map['notes'],
      iconPath: map['iconPath'],
    );
  }

}