import 'package:flutter_test/flutter_test.dart';
import 'package:modern_turkmen/view_models/exercise_view_model.dart';

void main() {
  group('ExerciseViewModel', () {
    test('initial state is correct', () {
      final viewModel = ExerciseViewModel();
      expect(viewModel.someProperty, expectedValue);
    });

    test('someFunction works correctly', () {
      final viewModel = ExerciseViewModel();
      viewModel.someFunction();
      expect(viewModel.someProperty, expectedValueAfterFunction);
    });
  });
}