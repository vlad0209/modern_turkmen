import '../../services/shared_preferences_service.dart';
import 'onboarding_repository.dart';

class OnboardingRepositoryLocal implements OnboardingRepository {
  final SharedPreferencesService _sharedPreferencesService;

  OnboardingRepositoryLocal(
      {required SharedPreferencesService sharedPreferencesService})
      : _sharedPreferencesService = sharedPreferencesService;

  @override
  Future<bool> isFirstLaunch() async {
    return await _sharedPreferencesService.isFirstLaunch();
  }

  @override
  Future<void> completeOnboarding() async {
    await _sharedPreferencesService.setOnboardingCompleted();
  }
}