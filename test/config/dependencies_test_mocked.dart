import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modern_turkmen/config/dependencies.dart';
import 'package:modern_turkmen/data/repositories/exercise/exercise_repository_remote.dart';
import 'package:modern_turkmen/data/repositories/tutorial/tutorial_repository_remote.dart';
import 'package:modern_turkmen/data/services/firestore/firestore_service.dart';
import 'package:modern_turkmen/data/services/shared_preferences_service.dart';

void main() {
  group('Dependencies Tests with Mocking', () {
    late ProviderContainer container;

    setUp(() {
      // Create container with overrides for Firebase-dependent providers
      container = ProviderContainer(
        overrides: [
          // Override firestore provider with fake firestore
          firebaseFirestoreProvider.overrideWithValue(FakeFirebaseFirestore()),
        ],
      );
    });

    tearDown(() {
      container.dispose();
    });

    test('sharedPreferencesServiceProvider returns SharedPreferencesService instance', () {
      final service = container.read(sharedPreferencesServiceProvider);
      expect(service, isA<SharedPreferencesService>());
    });

    test('firestoreServiceProvider returns FirestoreService instance', () {
      final service = container.read(firestoreServiceProvider);
      expect(service, isA<FirestoreService>());
    });

    test('tutorialRepositoryProvider returns TutorialRepositoryRemote instance', () {
      final repository = container.read(tutorialRepositoryProvider);
      expect(repository, isA<TutorialRepositoryRemote>());
    });

    test('exerciseRepositoryProvider returns ExerciseRepositoryRemote instance', () {
      final repository = container.read(exerciseRepositoryProvider);
      expect(repository, isA<ExerciseRepositoryRemote>());
    });

    test('providers maintain dependency relationships', () {
      final firestoreService = container.read(firestoreServiceProvider);
      final tutorialRepository = container.read(tutorialRepositoryProvider);
      
      expect(firestoreService, isA<FirestoreService>());
      expect(tutorialRepository, isA<TutorialRepositoryRemote>());
    });

    test('multiple containers can coexist with different overrides', () {
      final container1 = ProviderContainer(
        overrides: [
          firebaseFirestoreProvider.overrideWithValue(FakeFirebaseFirestore()),
        ],
      );
      final container2 = ProviderContainer(
        overrides: [
          firebaseFirestoreProvider.overrideWithValue(FakeFirebaseFirestore()),
        ],
      );
      
      final service1 = container1.read(firestoreServiceProvider);
      final service2 = container2.read(firestoreServiceProvider);
      
      expect(service1, isA<FirestoreService>());
      expect(service2, isA<FirestoreService>());
      
      container1.dispose();
      container2.dispose();
    });

    test('dependency injection works with overrides', () {
      // Test that we can override specific providers
      final customFirestore = FakeFirebaseFirestore();
      final testContainer = ProviderContainer(
        overrides: [
          firebaseFirestoreProvider.overrideWithValue(customFirestore),
        ],
      );
      
      final firestoreService = testContainer.read(firestoreServiceProvider);
      expect(firestoreService, isA<FirestoreService>());
      
      testContainer.dispose();
    });

    test('container disposal works correctly', () {
      expect(() {
        final testContainer = ProviderContainer(
          overrides: [
            firebaseFirestoreProvider.overrideWithValue(FakeFirebaseFirestore()),
          ],
        );
        
        // Read some providers
        testContainer.read(sharedPreferencesServiceProvider);
        testContainer.read(firestoreServiceProvider);
        
        // Dispose should work without errors
        testContainer.dispose();
      }, returnsNormally);
    });
  });
}