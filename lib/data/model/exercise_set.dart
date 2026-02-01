import 'package:gymtracker/data/model/exercise.dart';

class ExerciseSet {
  final int id;
  final Exercise exercise;
  final int repetitions;
  final double weight;
  final double rpe;

  const ExerciseSet({
    required this.id,
    required this.exercise,
    required this.repetitions,
    required this.weight,
    required this.rpe});
}