import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modern_turkmen/data/repositories/language/language_repository_local.dart';
import 'package:modern_turkmen/data/services/firestore/firestore_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/repositories/audio/audio_repository.dart';
import '../data/repositories/audio/audio_repository_remote.dart';
import '../data/repositories/exercise/exercise_repository.dart';
import '../data/repositories/exercise/exercise_repository_remote.dart';
import '../data/repositories/language/language_repository.dart';
import '../data/repositories/tutorial/tutorial_repository.dart';
import '../data/repositories/tutorial/tutorial_repository_remote.dart';
import '../data/services/audio_player_service.dart';
import '../data/services/shared_preferences_service.dart';

part 'dependencies.g.dart';

@riverpod
FirebaseFirestore firebaseFirestore(Ref ref) {
  return FirebaseFirestore.instance;
}

@riverpod
AudioPlayer audioPlayer(Ref ref) {
  return AudioPlayer();
}

@riverpod
SharedPreferencesService sharedPreferencesService(Ref ref) {
  return SharedPreferencesService();
}

@riverpod
FirestoreService firestoreService(Ref ref) {
  return FirestoreService(ref.watch(firebaseFirestoreProvider));
}

@riverpod
AudioPlayerService audioPlayerService(Ref ref) {
  return AudioPlayerService(ref.watch(audioPlayerProvider));
}

@riverpod
TutorialRepository tutorialRepository(Ref ref) {
  return TutorialRepositoryRemote(
      firestoreService: ref.watch(firestoreServiceProvider),
      sharedPreferencesService: ref.watch(sharedPreferencesServiceProvider));
}

@riverpod
ExerciseRepository exerciseRepository(Ref ref) {
  return ExerciseRepositoryRemote(
      firestoreService: ref.watch(firestoreServiceProvider),
      sharedPreferencesService: ref.watch(sharedPreferencesServiceProvider));
}

@riverpod
AudioRepository audioRepository(Ref ref) {
  return AudioRepositoryRemote(
      audioPlayerService: ref.watch(audioPlayerServiceProvider));
}

@riverpod
LanguageRepository languageRepository(Ref ref) {
  final languageRepository = LanguageRepositoryLocal(
      sharedPreferencesService: ref.watch(sharedPreferencesServiceProvider));
  return languageRepository;
}
