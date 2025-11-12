import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modern_turkmen/data/repositories/language/language_repository.dart';
import 'package:modern_turkmen/data/repositories/onboarding/onboarding_repository.dart';
import 'package:modern_turkmen/data/repositories/tutorial/tutorial_repository.dart';
import 'package:modern_turkmen/domain/models/language.dart';
import 'package:modern_turkmen/ui/view_model/app_view_model.dart';
import 'package:modern_turkmen/config/dependencies.dart';

import 'app_view_model_test.mocks.dart';

@GenerateMocks([LanguageRepository, TutorialRepository, OnboardingRepository])
void main() {
  late MockLanguageRepository mockLanguageRepository;
  late MockTutorialRepository mockTutorialRepository;
  late MockOnboardingRepository mockOnboardingRepository;
  late ProviderContainer container;

  setUp(() {
    mockLanguageRepository = MockLanguageRepository();
    mockTutorialRepository = MockTutorialRepository();
    mockOnboardingRepository = MockOnboardingRepository();

    container = ProviderContainer(
      overrides: [
        languageRepositoryProvider.overrideWithValue(mockLanguageRepository),
        tutorialRepositoryProvider.overrideWithValue(mockTutorialRepository),
        onboardingRepositoryProvider.overrideWithValue(mockOnboardingRepository),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('AppViewModel', () {
    test('should build initial state correctly', () async {
      // Arrange
      when(mockLanguageRepository.currentLanguage).thenReturn(MockLanguage('en', 'English'));
      when(mockTutorialRepository.getBookmarkedTutorialId()).thenAnswer((_) async => 'tutorial123');
      when(mockOnboardingRepository.isFirstLaunch()).thenAnswer((_) async => true);

      // Act
      final result = await container.read(appViewModelProvider.future);

      // Assert
      expect(result.preferredLanguage, 'en');
      expect(result.bookmarkedTutorialId, 'tutorial123');
      expect(result.isFirstLaunch, true);
    });

    test('should handle null tutorial id', () async {
      // Arrange
      when(mockLanguageRepository.currentLanguage).thenReturn(MockLanguage('tk', 'Turkmen'));
      when(mockTutorialRepository.getBookmarkedTutorialId()).thenAnswer((_) async => null);
      when(mockOnboardingRepository.isFirstLaunch()).thenAnswer((_) async => false);

      // Act
      final result = await container.read(appViewModelProvider.future);

      // Assert
      expect(result.preferredLanguage, 'tk');
      expect(result.bookmarkedTutorialId, null);
      expect(result.isFirstLaunch, false);
    });

    test('should update state when language changes', () async {
      // Arrange
      when(mockLanguageRepository.currentLanguage).thenReturn(MockLanguage('en', 'English'));
      when(mockTutorialRepository.getBookmarkedTutorialId()).thenAnswer((_) async => null);
      when(mockOnboardingRepository.isFirstLaunch()).thenAnswer((_) async => false);

      // Act
      await container.read(appViewModelProvider.future);
      
      // Simulate language change
      when(mockLanguageRepository.currentLanguage).thenReturn(MockLanguage('tk', 'Turkmen'));
      final callback = verify(mockLanguageRepository.addListener(captureAny)).captured.single;
      callback();

      // Assert
      final updatedState = container.read(appViewModelProvider).value!;
      expect(updatedState.preferredLanguage, 'tk');
    });
  });
}

class MockLanguage implements Language {
  @override
  final String code;
  @override
  final String name;
  MockLanguage(this.code, this.name);
  
  
}