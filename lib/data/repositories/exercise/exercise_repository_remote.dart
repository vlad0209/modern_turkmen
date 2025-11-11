import 'package:modern_turkmen/data/services/firestore/firestore_service.dart';
import 'package:modern_turkmen/data/services/shared_preferences_service.dart';
import 'package:modern_turkmen/domain/models/exercise/exercise.dart';
import 'package:modern_turkmen/domain/models/exercise_item/exercise_item.dart';

import 'exercise_repository.dart';

class ExerciseRepositoryRemote implements ExerciseRepository {
  final FirestoreService _firestoreService;
  final SharedPreferencesService _sharedPreferencesService;

  ExerciseRepositoryRemote({
    required FirestoreService firestoreService,
    required SharedPreferencesService sharedPreferencesService,
  })  : _firestoreService = firestoreService,
        _sharedPreferencesService = sharedPreferencesService;

  @override
  Future<Exercise> getExercise(
      {required String tutorialId,
      required String languageCode,
      required String exerciseId}) async {
    final model = await _firestoreService.getExerciseById(
        tutorialId, languageCode, exerciseId);
    return Exercise(
        id: model.id,
        description: model.description,
        example: model.example,
        exampleTranslation: model.exampleTranslation,
        items: model.items
            .map((json) => ExerciseItem.fromJson({
                  ...json,
                  'options': List.from(json['options'])
                    ..shuffle()
                }))
            .toList());
  }

  @override
  Future<String?> getNextExerciseId(
      {required String tutorialId,
      required String languageCode,
      required String currentExerciseId}) {
    return _firestoreService.getNextExerciseId(
      tutorialId: tutorialId,
      languageCode: languageCode,
      currentExerciseId: currentExerciseId,
    );
  }

  @override
  Future<String?> getFirstExerciseId(String tutorialId) async {
    final languageCode =
        await _sharedPreferencesService.getPreferredLanguageCode();
    return await _firestoreService.getFirstExerciseId(
        tutorialId: tutorialId, languageCode: languageCode);
  }
}
