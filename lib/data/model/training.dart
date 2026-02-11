class Training{
  final int trainingId;
  final String name;
  final String notes;
  final String iconPath;

  const Training({
    required this.trainingId,
    required this.name,
    required this.notes,
    required this.iconPath});

  Map<String, Object?> toMap(){
    return {'trainingId': trainingId, 'name': name, 'notes': notes, 'iconPath': iconPath};
  }

  @override
  String toString() {
    return 'Exercise{id: $trainingId, name: $name, notes: $notes, iconPath: $iconPath}';
  }

  factory Training.fromMap(Map<String, dynamic> map) {
    return Training(
      trainingId:  map['trainingId'],
      name: map['name'],
      notes: map['notes'],
      iconPath: map['iconPath'],
    );
  }
}