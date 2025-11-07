import 'dart:async';
import 'package:modern_turkmen/domain/models/exercise/exercise.dart';

abstract class ExerciseRepository {
  Future<Exercise> getExercise(
      {required String tutorialId,
      required String languageCode,
      required String exerciseId});

  Future<String?> getNextExerciseId(
      {required String tutorialId,
      required String languageCode,
      required String currentExerciseId});

  Future<String?> getFirstExerciseId(String tutorialId);
}
