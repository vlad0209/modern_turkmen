import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modern_turkmen/data/repositories/exercise/exercise_repository_remote.dart';
import 'package:modern_turkmen/data/services/firestore/firestore_service.dart';
import 'package:modern_turkmen/data/services/firestore/model/exercise/exercise_firestore_model.dart';
import 'package:modern_turkmen/data/services/shared_preferences_service.dart';

import 'exercise_repository_remote_test.mocks.dart';

@GenerateMocks([FirestoreService, SharedPreferencesService, ExerciseFirestoreModel])
void main() {
  late ExerciseRepositoryRemote repository;
  late MockFirestoreService mockFirestoreService;
  late MockSharedPreferencesService mockSharedPreferencesService;

  setUp(() {
    mockFirestoreService = MockFirestoreService();
    mockSharedPreferencesService = MockSharedPreferencesService();
    repository = ExerciseRepositoryRemote(
      firestoreService: mockFirestoreService,
      sharedPreferencesService: mockSharedPreferencesService,
    );
  });

  group('ExerciseRepositoryRemote', () {
    group('getExercise', () {
      test('should return exercise with shuffled options', () async {
        // Arrange
        const tutorialId = 'tutorial1';
        const languageCode = 'en';
        const exerciseId = 'exercise1';
        
        final mockExerciseModel = MockExerciseFirestoreModel();
        when(mockExerciseModel.id).thenReturn('exercise1');
        when(mockExerciseModel.description).thenReturn('Test description');
        when(mockExerciseModel.example).thenReturn('Test example');
        when(mockExerciseModel.exampleTranslation).thenReturn('Test translation');
        when(mockExerciseModel.items).thenReturn([
          {'id': 'item1', 'options': ['A', 'B', 'C'], 'sentence': 'Sentence 1', 'translation': 'Translation 1', 'solution': 'A'},
          {'id': 'item2', 'options': ['D', 'E', 'F'], 'sentence': 'Sentence 2', 'translation': 'Translation 2', 'solution': 'D'},
        ]);

        when(mockFirestoreService.getExerciseById(tutorialId, languageCode, exerciseId))
            .thenAnswer((_) async => mockExerciseModel);

        // Act
        final result = await repository.getExercise(
          tutorialId: tutorialId,
          languageCode: languageCode,
          exerciseId: exerciseId,
        );

        // Assert
        expect(result.id, 'exercise1');
        expect(result.description, 'Test description');
        expect(result.example, 'Test example');
        expect(result.exampleTranslation, 'Test translation');
        expect(result.items, isNotEmpty);
        verify(mockFirestoreService.getExerciseById(tutorialId, languageCode, exerciseId)).called(1);
      });
    });

    group('getNextExerciseId', () {
      test('should return next exercise id', () async {
        // Arrange
        const tutorialId = 'tutorial1';
        const languageCode = 'en';
        const currentExerciseId = 'exercise1';
        const expectedNextId = 'exercise2';

        when(mockFirestoreService.getNextExerciseId(
          tutorialId: tutorialId,
          languageCode: languageCode,
          currentExerciseId: currentExerciseId,
        )).thenAnswer((_) async => expectedNextId);

        // Act
        final result = await repository.getNextExerciseId(
          tutorialId: tutorialId,
          languageCode: languageCode,
          currentExerciseId: currentExerciseId,
        );

        // Assert
        expect(result, expectedNextId);
        verify(mockFirestoreService.getNextExerciseId(
          tutorialId: tutorialId,
          languageCode: languageCode,
          currentExerciseId: currentExerciseId,
        )).called(1);
      });
    });

    group('getFirstExerciseId', () {
      test('should return first exercise id using preferred language', () async {
        // Arrange
        const tutorialId = 'tutorial1';
        const preferredLanguage = 'en';
        const expectedFirstId = 'exercise1';

        when(mockSharedPreferencesService.getPreferredLanguageCode())
            .thenAnswer((_) async => preferredLanguage);
        when(mockFirestoreService.getFirstExerciseId(
          tutorialId: tutorialId,
          languageCode: preferredLanguage,
        )).thenAnswer((_) async => expectedFirstId);

        // Act
        final result = await repository.getFirstExerciseId(tutorialId);

        // Assert
        expect(result, expectedFirstId);
        verify(mockSharedPreferencesService.getPreferredLanguageCode()).called(1);
        verify(mockFirestoreService.getFirstExerciseId(
          tutorialId: tutorialId,
          languageCode: preferredLanguage,
        )).called(1);
      });
    });
  });
}