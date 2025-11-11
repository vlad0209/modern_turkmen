import 'package:flutter_test/flutter_test.dart';
import 'package:modern_turkmen/repositories/exercise_repository.dart';

void main() {
  group('ExerciseRepository', () {
    late ExerciseRepository exerciseRepository;

    setUp(() {
      exerciseRepository = ExerciseRepository();
    });

    test('should return a list of exercises', () async {
      final exercises = await exerciseRepository.getExercises();
      expect(exercises, isA<List<Exercise>>());
    });

    test('should add an exercise', () async {
      final exercise = Exercise(name: 'Push Up');
      await exerciseRepository.addExercise(exercise);
      final exercises = await exerciseRepository.getExercises();
      expect(exercises, contains(exercise));
    });

    test('should remove an exercise', () async {
      final exercise = Exercise(name: 'Sit Up');
      await exerciseRepository.addExercise(exercise);
      await exerciseRepository.removeExercise(exercise);
      final exercises = await exerciseRepository.getExercises();
      expect(exercises, isNot(contains(exercise)));
    });
  });
}