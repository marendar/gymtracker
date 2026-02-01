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
    return {'id': trainingId, 'name': name, 'notes': notes};
  }
}