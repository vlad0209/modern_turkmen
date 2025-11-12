import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../config/dependencies.dart';
import '../../data/repositories/language/language_repository.dart';
import '../../data/repositories/onboarding/onboarding_repository.dart';
import '../../domain/models/language.dart';

part 'language_view_model.g.dart';

@riverpod
class LanguageViewModel extends _$LanguageViewModel {
  late LanguageRepository _languageRepository;
  late OnboardingRepository _onboardingRepository;
  @override
  Language build() {
    _languageRepository = ref.watch(languageRepositoryProvider);
    _onboardingRepository = ref.watch(onboardingRepositoryProvider);
    _languageRepository.addListener(() {
      state = _languageRepository.currentLanguage;
    });
    return _languageRepository.currentLanguage;
  }

  Future<void> setLanguage(String languageCode) async {
    await _languageRepository.setLanguage(languageCode);
    await _onboardingRepository.completeOnboarding();
  }
}