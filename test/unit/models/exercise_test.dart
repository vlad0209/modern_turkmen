import 'package:flutter_test/flutter_test.dart';
import 'package:modern_turkmen/models/exercise.dart';

void main() {
  group('Exercise Model', () {
    test('should have a valid title', () {
      final exercise = Exercise(title: 'Push Up', duration: 30);
      expect(exercise.title, 'Push Up');
    });

    test('should have a valid duration', () {
      final exercise = Exercise(title: 'Push Up', duration: 30);
      expect(exercise.duration, 30);
    });

    test('should return correct string representation', () {
      final exercise = Exercise(title: 'Push Up', duration: 30);
      expect(exercise.toString(), 'Exercise: Push Up, Duration: 30');
    });
  });
}