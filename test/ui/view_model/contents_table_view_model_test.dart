import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:modern_turkmen/data/repositories/language/language_repository.dart';
import 'package:modern_turkmen/data/repositories/tutorial/tutorial_repository.dart';
import 'package:modern_turkmen/domain/models/tutorial/tutorial.dart';
import 'package:modern_turkmen/ui/view_model/contents_table_view_model.dart';
import 'package:modern_turkmen/config/dependencies.dart';

import 'contents_table_view_model_test.mocks.dart';

@GenerateMocks([TutorialRepository, LanguageRepository])
void main() {
  late MockTutorialRepository mockTutorialRepository;
  late MockLanguageRepository mockLanguageRepository;
  late ProviderContainer container;

  setUp(() {
    mockTutorialRepository = MockTutorialRepository();
    mockLanguageRepository = MockLanguageRepository();

    container = ProviderContainer(
      overrides: [
        tutorialRepositoryProvider.overrideWithValue(mockTutorialRepository),
        languageRepositoryProvider.overrideWithValue(mockLanguageRepository),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('ContentsTableViewModel', () {
    test('build returns stream from tutorial repository', () async {
      final tutorials = [
        Tutorial(
            id: '1',
            title: 'Test Tutorial',
            thumbUrl: '',
            imageUrl: '',
            content: '',
            prevTutorialId: '',
            nextTutorialId: '')
      ];
      when(mockTutorialRepository.getTutorialsStream())
          .thenAnswer((_) => Stream.value(tutorials));

      // Listen to the provider to trigger the stream
      final subscription = container.listen(
        contentsTableViewModelProvider,
        (previous, next) {},
      );
      
      // Wait for the stream to emit
      await Future.delayed(Duration(milliseconds: 10));
      
      final asyncValue = container.read(contentsTableViewModelProvider);
      expect(asyncValue, isA<AsyncData<List<Tutorial>>>());
      expect(asyncValue.value, equals(tutorials));
      verify(mockTutorialRepository.getTutorialsStream()).called(1);
      
      subscription.close();
    });

    test('build adds listener to language repository', () {
      when(mockTutorialRepository.getTutorialsStream())
          .thenAnswer((_) => Stream.value([]));

      // Access the provider to trigger build()
      container.read(contentsTableViewModelProvider);

      verify(mockLanguageRepository.addListener(any)).called(greaterThan(0));
    });

    test('toggleLocale calls language repository toggleLocale', () {
      when(mockTutorialRepository.getTutorialsStream())
          .thenAnswer((_) => Stream.value([]));

      final notifier = container.read(contentsTableViewModelProvider.notifier);
      // Ensure the provider is built first
      container.read(contentsTableViewModelProvider);
      notifier.toggleLocale();

      verify(mockLanguageRepository.toggleLocale()).called(1);
    });

    test('language repository listener invalidates provider', () {
      when(mockTutorialRepository.getTutorialsStream())
          .thenAnswer((_) => Stream.value([]));

      // Access the provider to trigger build()
      container.read(contentsTableViewModelProvider);

      final capturedListener =
          verify(mockLanguageRepository.addListener(captureAny)).captured.first
              as VoidCallback;

      expect(() => capturedListener(), returnsNormally);
    });
  });
}
