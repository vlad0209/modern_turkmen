import 'package:flutter_test/flutter_test.dart';
import 'package:modern_turkmen/view_models/app_view_model.dart';

void main() {
  group('AppViewModel', () {
    late AppViewModel appViewModel;

    setUp(() {
      appViewModel = AppViewModel();
    });

    test('initial state is correct', () {
      expect(appViewModel.someProperty, equals(expectedValue));
    });

    test('method updates property correctly', () {
      appViewModel.someMethod();
      expect(appViewModel.someProperty, equals(updatedValue));
    });

    // Add more tests as needed
  });
}