import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modern_turkmen/data/repositories/onboarding/onboarding_repository_local.dart';
import 'package:modern_turkmen/data/services/shared_preferences_service.dart';

@GenerateMocks([SharedPreferencesService])
import 'onboarding_repository_local_test.mocks.dart';

void main() {
  late OnboardingRepositoryLocal repository;
  late MockSharedPreferencesService mockSharedPreferencesService;

  setUp(() {
    mockSharedPreferencesService = MockSharedPreferencesService();
    repository = OnboardingRepositoryLocal(
      sharedPreferencesService: mockSharedPreferencesService,
    );
  });

  group('OnboardingRepositoryLocal', () {
    group('isFirstLaunch', () {
      test('should return true when it is first launch', () async {
        // Arrange
        when(mockSharedPreferencesService.isFirstLaunch())
            .thenAnswer((_) async => true);

        // Act
        final result = await repository.isFirstLaunch();

        // Assert
        expect(result, true);
        verify(mockSharedPreferencesService.isFirstLaunch()).called(1);
      });

      test('should return false when it is not first launch', () async {
        // Arrange
        when(mockSharedPreferencesService.isFirstLaunch())
            .thenAnswer((_) async => false);

        // Act
        final result = await repository.isFirstLaunch();

        // Assert
        expect(result, false);
        verify(mockSharedPreferencesService.isFirstLaunch()).called(1);
      });
    });

    group('completeOnboarding', () {
      test('should call setOnboardingCompleted on shared preferences service', () async {
        // Arrange
        when(mockSharedPreferencesService.setOnboardingCompleted())
            .thenAnswer((_) async {});

        // Act
        await repository.completeOnboarding();

        // Assert
        verify(mockSharedPreferencesService.setOnboardingCompleted()).called(1);
      });
    });
  });
}