abstract class OnboardingRepository {
  Future<bool> isFirstLaunch();

  Future<void> completeOnboarding();
}