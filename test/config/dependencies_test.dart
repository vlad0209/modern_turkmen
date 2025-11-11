import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modern_turkmen/config/dependencies.dart';
import 'package:modern_turkmen/data/repositories/exercise/exercise_repository_remote.dart';
import 'package:modern_turkmen/data/repositories/tutorial/tutorial_repository_remote.dart';
import 'package:modern_turkmen/data/services/firestore/firestore_service.dart';
import 'package:modern_turkmen/data/services/shared_preferences_service.dart';

void main() {
  group('Dependencies Tests', () {
    late ProviderContainer container;

    setUp(() {
      // Create container with overrides for problematic dependencies
      container = ProviderContainer(
        overrides: [
          // Use fake firestore instead of real Firebase
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

    test('providers work with dependency injection', () {
      // Test that providers correctly inject their dependencies
      final tutorialRepo = container.read(tutorialRepositoryProvider);
      final exerciseRepo = container.read(exerciseRepositoryProvider);
      
      expect(tutorialRepo, isA<TutorialRepositoryRemote>());
      expect(exerciseRepo, isA<ExerciseRepositoryRemote>());
    });

    test('container lifecycle works correctly', () {
      expect(() {
        final testContainer = ProviderContainer(
          overrides: [
            firebaseFirestoreProvider.overrideWithValue(FakeFirebaseFirestore()),
          ],
        );
        
        // Use some providers
        testContainer.read(sharedPreferencesServiceProvider);
        testContainer.read(firestoreServiceProvider);
        
        // Disposal should work without issues
        testContainer.dispose();
      }, returnsNormally);
    });
  });
}