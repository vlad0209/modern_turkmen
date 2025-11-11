import 'package:flutter_test/flutter_test.dart';
import 'package:modern_turkmen/repositories/tutorial_repository.dart';

void main() {
  group('TutorialRepository', () {
    late TutorialRepository tutorialRepository;

    setUp(() {
      tutorialRepository = TutorialRepository();
    });

    test('should return a list of tutorials', () async {
      final tutorials = await tutorialRepository.getTutorials();
      expect(tutorials, isA<List<Tutorial>>());
    });

    test('should return a tutorial by id', () async {
      final tutorial = await tutorialRepository.getTutorialById(1);
      expect(tutorial, isNotNull);
      expect(tutorial.id, 1);
    });

    test('should add a tutorial', () async {
      final tutorial = Tutorial(id: 3, title: 'New Tutorial');
      await tutorialRepository.addTutorial(tutorial);
      final tutorials = await tutorialRepository.getTutorials();
      expect(tutorials, contains(tutorial));
    });

    test('should delete a tutorial', () async {
      await tutorialRepository.deleteTutorial(1);
      final tutorial = await tutorialRepository.getTutorialById(1);
      expect(tutorial, isNull);
    });
  });
}