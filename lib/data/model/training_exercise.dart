class TrainingExercise {
  final int trainingId;
  final int exerciseId;

  const TrainingExercise({required this.trainingId, required this.exerciseId});

  Map<String, Object?> toMap() {
    return {
      'training_id': trainingId,
      'exercise_id': exerciseId,
    };
  }

  factory TrainingExercise.fromMap(Map<String, Object?> map) {
    return TrainingExercise(
      trainingId: map['training_id'] as int,
      exerciseId: map['exercise_id'] as int,
    );
  }

  @override
  String toString() {
    return 'TrainingExercise(trainingId: $trainingId, exerciseId: $exerciseId)';
  }
}