import 'package:flutter_test/flutter_test.dart';
import 'package:modern_turkmen/repositories/onboarding_repository.dart';

void main() {
  group('OnboardingRepository', () {
    late OnboardingRepository onboardingRepository;

    setUp(() {
      onboardingRepository = OnboardingRepository();
    });

    test('should return onboarding data', () async {
      final data = await onboardingRepository.getOnboardingData();
      expect(data, isNotNull);
      expect(data.length, greaterThan(0));
    });

    test('should save onboarding status', () async {
      await onboardingRepository.saveOnboardingStatus(true);
      final status = await onboardingRepository.getOnboardingStatus();
      expect(status, true);
    });
  });
}