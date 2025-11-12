import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:modern_turkmen/data/repositories/audio/audio_repository.dart';
import 'package:modern_turkmen/data/repositories/exercise/exercise_repository.dart';
import 'package:modern_turkmen/data/repositories/tutorial/tutorial_repository.dart';
import 'package:modern_turkmen/domain/models/exercise/exercise.dart';
import 'package:modern_turkmen/domain/models/exercise_item/exercise_item.dart';
import 'package:modern_turkmen/ui/view_model/exercise_view_model.dart';
import 'package:modern_turkmen/config/dependencies.dart';

@GenerateMocks([ExerciseRepository, AudioRepository, TutorialRepository])
import 'exercise_view_model_test.mocks.dart';

void main() {
  late MockExerciseRepository mockExerciseRepository;
  late MockAudioRepository mockAudioRepository;
  late MockTutorialRepository mockTutorialRepository;
  late ProviderContainer container;

  setUp(() {
    mockExerciseRepository = MockExerciseRepository();
    mockAudioRepository = MockAudioRepository();
    mockTutorialRepository = MockTutorialRepository();

    when(mockAudioRepository.setSourceUrl(any)).thenAnswer((_) async {});

    container = ProviderContainer(
      overrides: [
        exerciseRepositoryProvider.overrideWithValue(mockExerciseRepository),
        audioRepositoryProvider.overrideWithValue(mockAudioRepository),
        tutorialRepositoryProvider.overrideWithValue(mockTutorialRepository),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('ExerciseViewModel', () {
    test('build returns initial state correctly', () async {
      final exercise = Exercise(
        items: [
          ExerciseItem(
            sentence: 'Hello <f/>',
            options: ['world', 'there'],
            sound: 'test.mp3',
            translation: '',
            solution: '',
          ),
        ],
        id: '',
        description: '',
        exampleTranslation: '',
        example: '',
      );

      when(mockExerciseRepository.getExercise(
        tutorialId: 'tutorial1',
        languageCode: 'en',
        exerciseId: 'exercise1',
      )).thenAnswer((_) async => exercise);

      when(mockAudioRepository.setSourceUrl('test.mp3'))
          .thenAnswer((_) async {});

      container.read(exerciseViewModelProvider(
        tutorialId: 'tutorial1',
        languageCode: 'en',
        exerciseId: 'exercise1',
      ).notifier);

      final state = await container.read(exerciseViewModelProvider(
        tutorialId: 'tutorial1',
        languageCode: 'en',
        exerciseId: 'exercise1',
      ).future);

      expect(state.exercise, equals(exercise));
      expect(state.itemIndex, equals(0));
      expect(state.sentence, equals('Hello <f/>'));
      expect(state.options, equals(['world', 'there']));
      expect(state.checking, equals(false));
      expect(state.isPlayingAudio, equals(false));
    });

    test('chooseWord updates sentence and removes option', () async {
      final exercise = Exercise(
        items: [
          ExerciseItem(
            sentence: 'Hello <f/>',
            options: ['world', 'there'],
            sound: '',
            translation: '',
            solution: '',
          ),
        ],
        id: '',
        description: '',
        exampleTranslation: '',
        example: '',
      );

      when(mockExerciseRepository.getExercise(
        tutorialId: 'tutorial1',
        languageCode: 'en',
        exerciseId: 'exercise1',
      )).thenAnswer((_) async => exercise);

      final viewModel = container.read(exerciseViewModelProvider(
        tutorialId: 'tutorial1',
        languageCode: 'en',
        exerciseId: 'exercise1',
      ).notifier);

      await container.read(exerciseViewModelProvider(
        tutorialId: 'tutorial1',
        languageCode: 'en',
        exerciseId: 'exercise1',
      ).future);

      final result = viewModel.chooseWord('world');

      expect(result, equals('Hello <f>world</f>'));
      expect(
          container
              .read(exerciseViewModelProvider(
                tutorialId: 'tutorial1',
                languageCode: 'en',
                exerciseId: 'exercise1',
              ))
              .value!
              .options,
          equals(['there']));
    });

    test('markItemAsNotSolved adds item to notSolvedItems', () async {
      final exercise = Exercise(items: [
        ExerciseItem(
            options: [], sentence: '', sound: '', translation: '', solution: '')
      ], id: '', description: '', exampleTranslation: '', example: '');

      when(mockExerciseRepository.getExercise(
        tutorialId: 'tutorial1',
        languageCode: 'en',
        exerciseId: 'exercise1',
      )).thenAnswer((_) async => exercise);

      final viewModel = container.read(exerciseViewModelProvider(
        tutorialId: 'tutorial1',
        languageCode: 'en',
        exerciseId: 'exercise1',
      ).notifier);

      await container.read(exerciseViewModelProvider(
        tutorialId: 'tutorial1',
        languageCode: 'en',
        exerciseId: 'exercise1',
      ).future);

      viewModel.markItemAsNotSolved();

      expect(
          container
              .read(exerciseViewModelProvider(
                tutorialId: 'tutorial1',
                languageCode: 'en',
                exerciseId: 'exercise1',
              ))
              .value!
              .notSolvedItems,
          contains(0));
    });

    test('markItemAsPassed adds item to solvedItems and passedItems', () async {
      final exercise = Exercise(items: [
        ExerciseItem(
            options: [], sentence: '', sound: '', translation: '', solution: '')
      ], id: '', description: '', exampleTranslation: '', example: '');

      when(mockExerciseRepository.getExercise(
        tutorialId: 'tutorial1',
        languageCode: 'en',
        exerciseId: 'exercise1',
      )).thenAnswer((_) async => exercise);

      final viewModel = container.read(exerciseViewModelProvider(
        tutorialId: 'tutorial1',
        languageCode: 'en',
        exerciseId: 'exercise1',
      ).notifier);

      await container.read(exerciseViewModelProvider(
        tutorialId: 'tutorial1',
        languageCode: 'en',
        exerciseId: 'exercise1',
      ).future);

      viewModel.markItemAsPassed();

      final state = container
          .read(exerciseViewModelProvider(
            tutorialId: 'tutorial1',
            languageCode: 'en',
            exerciseId: 'exercise1',
          ))
          .value!;

      expect(state.solvedItems, contains(0));
      expect(state.passedItems, contains(0));
    });

    test('hasNextItem returns correct boolean', () async {
      final exercise = Exercise(items: [
        ExerciseItem(
            options: [],
            sentence: '',
            sound: '',
            translation: '',
            solution: ''),
        ExerciseItem(
            options: [], sentence: '', sound: '', translation: '', solution: '')
      ], id: '', description: '', exampleTranslation: '', example: '');

      when(mockExerciseRepository.getExercise(
        tutorialId: 'tutorial1',
        languageCode: 'en',
        exerciseId: 'exercise1',
      )).thenAnswer((_) async => exercise);

      final viewModel = container.read(exerciseViewModelProvider(
        tutorialId: 'tutorial1',
        languageCode: 'en',
        exerciseId: 'exercise1',
      ).notifier);

      await container.read(exerciseViewModelProvider(
        tutorialId: 'tutorial1',
        languageCode: 'en',
        exerciseId: 'exercise1',
      ).future);

      expect(viewModel.hasNextItem(), isTrue);
    });

    test('pauseAudio calls repository and updates state', () async {
      final exercise = Exercise(items: [
        ExerciseItem(
            options: [], sentence: '', sound: '', translation: '', solution: '')
      ], id: '', description: '', exampleTranslation: '', example: '');

      when(mockExerciseRepository.getExercise(
        tutorialId: 'tutorial1',
        languageCode: 'en',
        exerciseId: 'exercise1',
      )).thenAnswer((_) async => exercise);

      final viewModel = container.read(exerciseViewModelProvider(
        tutorialId: 'tutorial1',
        languageCode: 'en',
        exerciseId: 'exercise1',
      ).notifier);

      await container.read(exerciseViewModelProvider(
        tutorialId: 'tutorial1',
        languageCode: 'en',
        exerciseId: 'exercise1',
      ).future);

      viewModel.pauseAudio();

      verify(mockAudioRepository.pauseAudio()).called(1);
      expect(
          container
              .read(exerciseViewModelProvider(
                tutorialId: 'tutorial1',
                languageCode: 'en',
                exerciseId: 'exercise1',
              ))
              .value!
              .isPlayingAudio,
          isFalse);
    });

    test('resumeAudio calls repository and updates state', () async {
      final exercise = Exercise(items: [
        ExerciseItem(
            options: [], sentence: '', sound: '', translation: '', solution: '')
      ], id: '', description: '', exampleTranslation: '', example: '');

      when(mockExerciseRepository.getExercise(
        tutorialId: 'tutorial1',
        languageCode: 'en',
        exerciseId: 'exercise1',
      )).thenAnswer((_) async => exercise);

      final viewModel = container.read(exerciseViewModelProvider(
        tutorialId: 'tutorial1',
        languageCode: 'en',
        exerciseId: 'exercise1',
      ).notifier);

      await container.read(exerciseViewModelProvider(
        tutorialId: 'tutorial1',
        languageCode: 'en',
        exerciseId: 'exercise1',
      ).future);

      viewModel.resumeAudio();

      verify(mockAudioRepository.resumeAudio()).called(1);
      expect(
          container
              .read(exerciseViewModelProvider(
                tutorialId: 'tutorial1',
                languageCode: 'en',
                exerciseId: 'exercise1',
              ))
              .value!
              .isPlayingAudio,
          isTrue);
    });

    test('getNextExerciseId calls repository with correct parameters',
        () async {
      final exercise = Exercise(items: [
        ExerciseItem(
            options: [], sentence: '', sound: '', translation: '', solution: '')
      ], id: '', description: '', exampleTranslation: '', example: '');

      when(mockExerciseRepository.getExercise(
        tutorialId: 'tutorial1',
        languageCode: 'en',
        exerciseId: 'exercise1',
      )).thenAnswer((_) async => exercise);

      when(mockExerciseRepository.getNextExerciseId(
        tutorialId: 'tutorial1',
        languageCode: 'en',
        currentExerciseId: 'exercise1',
      )).thenAnswer((_) async => 'exercise2');

      final viewModel = container.read(exerciseViewModelProvider(
        tutorialId: 'tutorial1',
        languageCode: 'en',
        exerciseId: 'exercise1',
      ).notifier);

      await container.read(exerciseViewModelProvider(
        tutorialId: 'tutorial1',
        languageCode: 'en',
        exerciseId: 'exercise1',
      ).future);

      final result = await viewModel.getNextExerciseId();

      expect(result, equals('exercise2'));
      verify(mockExerciseRepository.getNextExerciseId(
        tutorialId: 'tutorial1',
        languageCode: 'en',
        currentExerciseId: 'exercise1',
      )).called(1);
    });
  });
}
