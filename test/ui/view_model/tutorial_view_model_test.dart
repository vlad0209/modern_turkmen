import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modern_turkmen/data/repositories/exercise/exercise_repository.dart';
import 'package:modern_turkmen/data/repositories/tutorial/tutorial_repository.dart';
import 'package:modern_turkmen/domain/models/tutorial/tutorial.dart';
import 'package:modern_turkmen/ui/view_model/tutorial_view_model.dart';
import 'package:modern_turkmen/ui/ui_state/tutorial_ui_state.dart';
import 'package:modern_turkmen/config/dependencies.dart';

import 'tutorial_view_model_test.mocks.dart';

@GenerateMocks([TutorialRepository, ExerciseRepository, Tutorial])
void main() {
  group('TutorialViewModel', () {
    late MockTutorialRepository mockTutorialRepository;
    late MockExerciseRepository mockExerciseRepository;
    late ProviderContainer container;

    setUp(() {
      mockTutorialRepository = MockTutorialRepository();
      mockExerciseRepository = MockExerciseRepository();
      
      container = ProviderContainer(
        overrides: [
          tutorialRepositoryProvider.overrideWithValue(mockTutorialRepository),
          exerciseRepositoryProvider.overrideWithValue(mockExerciseRepository),
        ],
      );
    });

    tearDown(() {
      container.dispose();
    });

    test('should return TutorialUiState when build is called', () async {
      // Arrange
      const tutorialId = 'test-tutorial-id';
      final mockTutorial = MockTutorial();
      const mockExerciseId = 'mock-exercise-id';

      when(mockTutorialRepository.getTutorial(tutorialId))
          .thenAnswer((_) async => mockTutorial);
      when(mockExerciseRepository.getFirstExerciseId(tutorialId))
          .thenAnswer((_) async => mockExerciseId);

      // Act
      final result = await container.read(tutorialViewModelProvider(tutorialId).future);

      // Assert
      expect(result, isA<TutorialUiState>());
      expect(result.tutorial, equals(mockTutorial));
      expect(result.exerciseId, equals(mockExerciseId));
    });

    test('should call bookmarkTutorial during build', () async {
      // Arrange
      const tutorialId = 'test-tutorial-id';
      
      when(mockTutorialRepository.getTutorial(tutorialId))
          .thenAnswer((_) async => MockTutorial());
      when(mockExerciseRepository.getFirstExerciseId(tutorialId))
          .thenAnswer((_) async => 'mock-exercise-id');

      // Act
      await container.read(tutorialViewModelProvider(tutorialId).future);

      // Assert
      verify(mockTutorialRepository.bookmarkTutorial(tutorialId)).called(1);
    });

    test('should handle repository errors', () async {
      // Arrange
      const tutorialId = 'test-tutorial-id';
      
      when(mockTutorialRepository.getTutorial(tutorialId))
          .thenThrow(Exception('Tutorial not found'));

      // Act & Assert
      expect(
        () => container.read(tutorialViewModelProvider(tutorialId).future),
        throwsException,
      );
    });
  });
}