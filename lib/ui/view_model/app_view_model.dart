import 'package:modern_turkmen/data/repositories/language/language_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../config/dependencies.dart';
import '../../data/repositories/onboarding/onboarding_repository.dart';
import '../../data/repositories/tutorial/tutorial_repository.dart';
import '../ui_state/app_ui_state.dart';

part 'app_view_model.g.dart';

@riverpod
class AppViewModel extends _$AppViewModel {
  late TutorialRepository _tutorialRepository;
  late LanguageRepository _languageRepository;
  late OnboardingRepository _onboardingRepository;
  @override
  FutureOr<AppUiState> build() async {
    _languageRepository = ref.watch(languageRepositoryProvider);
    _tutorialRepository = ref.watch(tutorialRepositoryProvider);
    _onboardingRepository = ref.watch(onboardingRepositoryProvider);
    final tutorialId = await _tutorialRepository.getBookmarkedTutorialId();
    final isFirstLaunch = await _onboardingRepository.isFirstLaunch();
    _languageRepository.addListener(() {
      state = AsyncValue.data(state.value!.copyWith(
        preferredLanguage: _languageRepository.currentLanguage.code,
      ));
    });
    return AppUiState(
      preferredLanguage: _languageRepository.currentLanguage.code,
      bookmarkedTutorialId: tutorialId,
      isFirstLaunch: isFirstLaunch,
    );
  }
}