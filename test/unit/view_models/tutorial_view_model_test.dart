import 'package:flutter_test/flutter_test.dart';
import 'package:modern_turkmen/view_models/tutorial_view_model.dart';

void main() {
  group('TutorialViewModel', () {
    late TutorialViewModel viewModel;

    setUp(() {
      viewModel = TutorialViewModel();
    });

    test('initial state should be correct', () {
      expect(viewModel.someProperty, initialValue);
    });

    test('method should update property correctly', () {
      viewModel.someMethod();
      expect(viewModel.someProperty, updatedValue);
    });
  });
}