import 'package:flutter_test/flutter_test.dart';
import 'package:modern_turkmen/models/tutorial.dart';

void main() {
  group('Tutorial Model Tests', () {
    test('should create a Tutorial instance with given properties', () {
      final tutorial = Tutorial(id: 1, title: 'Test Tutorial', content: 'This is a test.');

      expect(tutorial.id, 1);
      expect(tutorial.title, 'Test Tutorial');
      expect(tutorial.content, 'This is a test.');
    });

    test('should return correct string representation', () {
      final tutorial = Tutorial(id: 1, title: 'Test Tutorial', content: 'This is a test.');

      expect(tutorial.toString(), 'Tutorial{id: 1, title: Test Tutorial, content: This is a test.}');
    });
  });
}