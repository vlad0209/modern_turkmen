import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:modern_turkmen/config/dependencies.dart';
import 'package:modern_turkmen/data/repositories/language/language_repository.dart';
import 'package:modern_turkmen/data/repositories/onboarding/onboarding_repository.dart';
import 'package:modern_turkmen/domain/models/language.dart';
import 'package:modern_turkmen/ui/view_model/language_view_model.dart';

@GenerateMocks([LanguageRepository, OnboardingRepository])
import 'language_view_model_test.mocks.dart';

void main() {
  group('LanguageViewModel', () {
    late MockLanguageRepository mockLanguageRepository;
    late MockOnboardingRepository mockOnboardingRepository;
    late ProviderContainer container;

    setUp(() {
      mockLanguageRepository = MockLanguageRepository();
      mockOnboardingRepository = MockOnboardingRepository();
      
      container = ProviderContainer(
        overrides: [
          languageRepositoryProvider.overrideWithValue(mockLanguageRepository),
          onboardingRepositoryProvider.overrideWithValue(mockOnboardingRepository),
        ],
      );
    });

    tearDown(() {
      container.dispose();
    });

    test('build returns current language from repository', () {
      final mockLanguage = Language(code: 'en', name: 'English');
      when(mockLanguageRepository.currentLanguage).thenReturn(mockLanguage);

      final viewModel = container.read(languageViewModelProvider);

      expect(viewModel, equals(mockLanguage));
      verify(mockLanguageRepository.addListener(any)).called(1);
    });

    test('setLanguage calls repository methods', () async {
      const languageCode = 'tk';
      
      final notifier = container.read(languageViewModelProvider.notifier);
      
      await notifier.setLanguage(languageCode);

      verify(mockLanguageRepository.setLanguage(languageCode)).called(1);
      verify(mockOnboardingRepository.completeOnboarding()).called(1);
    });

    test('state updates when language repository changes', () {
      final initialLanguage = Language(code: 'en', name: 'English');
      final updatedLanguage = Language(code: 'tk', name: 'Turkmen');
      
      when(mockLanguageRepository.currentLanguage).thenReturn(initialLanguage);
      
      final viewModel = container.read(languageViewModelProvider);
      expect(viewModel, equals(initialLanguage));

      when(mockLanguageRepository.currentLanguage).thenReturn(updatedLanguage);
      
      final capturedListener = verify(mockLanguageRepository.addListener(captureAny)).captured.single;
      capturedListener();

      final updatedViewModel = container.read(languageViewModelProvider);
      expect(updatedViewModel, equals(updatedLanguage));
    });
  });
}