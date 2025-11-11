import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modern_turkmen/config/dependencies.dart';
import 'package:modern_turkmen/data/repositories/audio/audio_repository_remote.dart';
import 'package:modern_turkmen/data/repositories/exercise/exercise_repository_remote.dart';
import 'package:modern_turkmen/data/repositories/language/language_repository_local.dart';
import 'package:modern_turkmen/data/repositories/onboarding/onboarding_repository_local.dart';
import 'package:modern_turkmen/data/repositories/tutorial/tutorial_repository_remote.dart';
import 'package:modern_turkmen/data/services/audio_player_service.dart';
import 'package:modern_turkmen/data/services/firestore/firestore_service.dart';
import 'package:modern_turkmen/data/services/shared_preferences_service.dart';

void main() {
  group('Dependencies Tests', () {
    late ProviderContainer container;

    setUpAll(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      
      // Mock SharedPreferences
      const channel = MethodChannel('plugins.flutter.io/shared_preferences');
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (methodCall) async {
        if (methodCall.method == 'getAll') {
          return <String, dynamic>{};
        }
        return null;
      });
      
      // Mock AudioPlayers
      const audioChannel = MethodChannel('xyz.luan/audioplayers');
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(audioChannel, (methodCall) async {
        return null;
      });
    });

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('firebaseFirestoreProvider returns FirebaseFirestore instance', () {
      final firestore = container.read(firebaseFirestoreProvider);
      expect(firestore, isA<FirebaseFirestore>());
      expect(firestore, equals(FirebaseFirestore.instance));
    });

    test('audioPlayerProvider returns AudioPlayer instance', () {
      final audioPlayer = container.read(audioPlayerProvider);
      expect(audioPlayer, isA<AudioPlayer>());
    });

    test('sharedPreferencesServiceProvider returns SharedPreferencesService instance', () {
      final service = container.read(sharedPreferencesServiceProvider);
      expect(service, isA<SharedPreferencesService>());
    });

    test('firestoreServiceProvider returns FirestoreService instance', () {
      final service = container.read(firestoreServiceProvider);
      expect(service, isA<FirestoreService>());
    });

    test('audioPlayerServiceProvider returns AudioPlayerService instance', () {
      final service = container.read(audioPlayerServiceProvider);
      expect(service, isA<AudioPlayerService>());
    });

    test('tutorialRepositoryProvider returns TutorialRepositoryRemote instance', () {
      final repository = container.read(tutorialRepositoryProvider);
      expect(repository, isA<TutorialRepositoryRemote>());
    });

    test('exerciseRepositoryProvider returns ExerciseRepositoryRemote instance', () {
      final repository = container.read(exerciseRepositoryProvider);
      expect(repository, isA<ExerciseRepositoryRemote>());
    });

    test('audioRepositoryProvider returns AudioRepositoryRemote instance', () {
      final repository = container.read(audioRepositoryProvider);
      expect(repository, isA<AudioRepositoryRemote>());
    });

    test('languageRepositoryProvider returns LanguageRepositoryLocal instance', () {
      final repository = container.read(languageRepositoryProvider);
      expect(repository, isA<LanguageRepositoryLocal>());
    });

    test('onboardingRepositoryProvider returns OnboardingRepositoryLocal instance', () {
      final repository = container.read(onboardingRepositoryProvider);
      expect(repository, isA<OnboardingRepositoryLocal>());
    });

    test('providers return same instance on multiple reads', () {
      final service1 = container.read(sharedPreferencesServiceProvider);
      final service2 = container.read(sharedPreferencesServiceProvider);
      expect(identical(service1, service2), isTrue);
    });

    test('providers maintain dependency relationships', () {
      final firestoreService = container.read(firestoreServiceProvider);
      final tutorialRepository = container.read(tutorialRepositoryProvider);
      
      expect(firestoreService, isA<FirestoreService>());
      expect(tutorialRepository, isA<TutorialRepositoryRemote>());
    });
  });
}