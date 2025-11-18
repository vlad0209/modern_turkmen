// ignore_for_file: scoped_providers_should_specify_dependencies
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modern_turkmen/config/dependencies.dart';
import 'package:modern_turkmen/data/repositories/audio/audio_repository.dart';
import 'package:modern_turkmen/data/repositories/exercise/exercise_repository.dart';
import 'package:modern_turkmen/data/repositories/tutorial/tutorial_repository.dart';
import 'package:modern_turkmen/domain/models/exercise/exercise.dart';
import 'package:modern_turkmen/domain/models/exercise_item/exercise_item.dart';
import 'package:modern_turkmen/l10n/app_localizations.dart';
import 'package:modern_turkmen/ui/widgets/exercise_screen.dart';
import 'package:modern_turkmen/ui/widgets/word_card.dart';

import 'exercise_screen_test.mocks.dart';

@GenerateMocks([ExerciseRepository, AudioRepository, TutorialRepository, GoRouter])
void main() {
  group('ExerciseScreen', () {
    late MockExerciseRepository mockExerciseRepository;
    late MockAudioRepository mockAudioRepository;
    late MockTutorialRepository mockTutorialRepository;

    setUp(() {
      mockExerciseRepository = MockExerciseRepository();
      mockAudioRepository = MockAudioRepository();
      mockTutorialRepository = MockTutorialRepository();

      // Setup audio repository streams
      when(mockAudioRepository.onPlayingStarted)
          .thenAnswer((_) => const Stream.empty());
      when(mockAudioRepository.onPlayingCompleted)
          .thenAnswer((_) => const Stream.empty());
      when(mockAudioRepository.pauseAudio())
          .thenAnswer((_) async => {});
      when(mockAudioRepository.resumeAudio())
          .thenAnswer((_) async => {});
    });

    Widget createTestWidget({
      Exercise? exercise,
      bool shouldThrowError = false,
    }) {
      final testExercise = exercise ?? Exercise(
        id: 'test-exercise',
        description: 'Test description',
        example: 'Test example',
        exampleTranslation: 'Test translation',
        items: [
          ExerciseItem(
            translation: 'Item translation',
            solution: 'correct answer',
            sound: null,
            options: ['option1', 'option2'],
            sentence: 'Test sentence <f/>',
          ),
        ],
      );

      if (shouldThrowError) {
        when(mockExerciseRepository.getExercise(
          tutorialId: anyNamed('tutorialId'),
          languageCode: anyNamed('languageCode'),
          exerciseId: anyNamed('exerciseId'),
        )).thenThrow(Exception('Test error'));
      } else {
        when(mockExerciseRepository.getExercise(
          tutorialId: anyNamed('tutorialId'),
          languageCode: anyNamed('languageCode'),
          exerciseId: anyNamed('exerciseId'),
        )).thenAnswer((_) async => testExercise);
      }

      when(mockAudioRepository.setSourceUrl(any))
          .thenAnswer((_) async => Future.value());

      return ProviderScope(
        overrides: [
          exerciseRepositoryProvider.overrideWithValue(mockExerciseRepository),
          audioRepositoryProvider.overrideWithValue(mockAudioRepository),
          tutorialRepositoryProvider.overrideWithValue(mockTutorialRepository),
        ],
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const ExerciseScreen(
            tutorialId: 'test-tutorial',
            exerciseId: 'test-exercise',
            locale: 'en',
          ),
        ),
      );
    }

    testWidgets('shows loading indicator when state is loading',
        (tester) async {
      // Mock a slow loading exercise to show loading state using a Completer
      final completer = Completer<Exercise>();
      when(mockExerciseRepository.getExercise(
        tutorialId: anyNamed('tutorialId'),
        languageCode: anyNamed('languageCode'),
        exerciseId: anyNamed('exerciseId'),
      )).thenAnswer((_) => completer.future);

      when(mockAudioRepository.setSourceUrl(any))
          .thenAnswer((_) async => Future.value());

      final widget = ProviderScope(
        overrides: [
          exerciseRepositoryProvider.overrideWithValue(mockExerciseRepository),
          audioRepositoryProvider.overrideWithValue(mockAudioRepository),
          tutorialRepositoryProvider.overrideWithValue(mockTutorialRepository),
        ],
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const ExerciseScreen(
            tutorialId: 'test-tutorial',
            exerciseId: 'test-exercise',
            locale: 'en',
          ),
        ),
      );

      await tester.pumpWidget(widget);

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      
      // Complete the future to clean up
      completer.complete(Exercise(
        id: 'test',
        description: 'Test',
        items: [],
        example: '',
        exampleTranslation: '',
      ));
      await tester.pumpAndSettle();
    });

    testWidgets('shows error message when state has error', (tester) async {
      await tester.pumpWidget(createTestWidget(shouldThrowError: true));
      await tester.pumpAndSettle();

      expect(find.textContaining('Exception: Test error'), findsOneWidget);
    });

    testWidgets('shows exercise content when state has data', (tester) async {
      final exercise = Exercise(
        id: 'test-exercise',
        description: 'Test description',
        example: 'Test example',
        exampleTranslation: 'Test translation',
        items: [
          ExerciseItem(
            translation: 'Item translation',
            solution: 'correct answer',
            sound: null,
            options: ['option1', 'option2'],
            sentence: 'Test sentence <f/>',
          ),
        ],
      );

      await tester.pumpWidget(createTestWidget(exercise: exercise));
      await tester.pumpAndSettle();

      expect(find.text('Test description'), findsOneWidget);
      expect(find.text('Test translation'), findsOneWidget);
      expect(find.text('Item translation'), findsOneWidget);
    });

    testWidgets('shows play button when not playing audio', (tester) async {
      final exercise = Exercise(
        id: 'test-exercise',
        description: 'Test',
        example: '',
        exampleTranslation: '',
        items: [
          ExerciseItem(
            translation: 'Test',
            solution: 'test',
            options: [],
            sentence: 'Test sentence',
            sound: 'test.mp3',
          ),
        ],
      );

      await tester.pumpWidget(createTestWidget(exercise: exercise));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.play_arrow), findsOneWidget);
    });

    testWidgets('shows options when item is not passed', (tester) async {
      final exercise = Exercise(
        id: 'test-exercise',
        description: 'Test',
        example: '',
        exampleTranslation: '',
        items: [
          ExerciseItem(
            translation: 'Test',
            solution: 'test',
            options: ['option1', 'option2'],
            sentence: 'Test sentence <f/>',
            sound: null,
          ),
        ],
      );

      await tester.pumpWidget(createTestWidget(exercise: exercise));
      await tester.pumpAndSettle();

      expect(find.byType(WordCard), findsWidgets);
      expect(find.text('option1'), findsOneWidget);
      expect(find.text('option2'), findsOneWidget);
    });
  });
}
