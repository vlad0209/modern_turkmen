import 'package:flutter_test/flutter_test.dart';
import 'package:modern_turkmen/domain/models/exercise_item/exercise_item.dart';

void main() {
  group('ExerciseItem', () {
    test('should create an ExerciseItem with given properties', () {
      final exerciseItem = ExerciseItem(
          options: [],
          sentence: 'Push Up',
          sound: 'http://example.com/sound.mp3',
          translation: 'A basic exercise',
          solution: 'Push Up Solution',);

      expect(exerciseItem.options, []);
      expect(exerciseItem.sentence, 'Push Up');
      expect(exerciseItem.sound, 'http://example.com/sound.mp3');
      expect(exerciseItem.translation, 'A basic exercise');
      expect(exerciseItem.solution, 'Push Up Solution');
    });

    test('should return correct string representation', () {
      final exerciseItem = ExerciseItem(id: 1, name: 'Push Up', duration: 30);

      expect(exerciseItem.toString(),
          'ExerciseItem{id: 1, name: Push Up, duration: 30}');
    });
  });
}
