import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:modern_turkmen/data/repositories/onboarding/onboarding_repository.dart';
import 'package:modern_turkmen/routing/router.dart';

import 'router_test.mocks.dart';

@GenerateMocks([OnboardingRepository])
void main() {
  late MockOnboardingRepository mockOnboardingRepository;

  setUp(() {
    mockOnboardingRepository = MockOnboardingRepository();
  });

  group('Router Tests', () {
    test('should create router instance when tutorialId is null', () {
      final goRouter = router(null, mockOnboardingRepository);
      
      expect(goRouter, isNotNull);
      expect(goRouter.routeInformationParser, isNotNull);
      expect(goRouter.routerDelegate, isNotNull);
    });

    test('should create router instance when tutorialId is empty', () {
      final goRouter = router('', mockOnboardingRepository);
      
      expect(goRouter, isNotNull);
      expect(goRouter.routeInformationParser, isNotNull);
      expect(goRouter.routerDelegate, isNotNull);
    });

    test('should create router instance when tutorialId is provided', () {
      final goRouter = router('123', mockOnboardingRepository);
      
      expect(goRouter, isNotNull);
      expect(goRouter.routeInformationParser, isNotNull);
      expect(goRouter.routerDelegate, isNotNull);
    });


  });
}