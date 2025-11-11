import 'package:modern_turkmen/data/services/firestore/firestore_service.dart';
import 'package:modern_turkmen/data/services/shared_preferences_service.dart';
import 'package:modern_turkmen/domain/models/tutorial/tutorial.dart';

import '../../../utils/localizer.dart';
import 'tutorial_repository.dart';

class TutorialRepositoryRemote with Localizer implements TutorialRepository {
  final FirestoreService _firestoreService;
  final SharedPreferencesService _sharedPreferencesService;

  TutorialRepositoryRemote(
      {required FirestoreService firestoreService,
      required SharedPreferencesService sharedPreferencesService})
      : _firestoreService = firestoreService,
        _sharedPreferencesService = sharedPreferencesService;

  @override
  Stream<List<Tutorial>> getTutorialsStream() async* {
    final languageCode =
        await _sharedPreferencesService.getPreferredLanguageCode();
    yield* _firestoreService
        .getPublicTutorialsStream(languageCode)
        .map((tutorialFirestoreModels) {
      return tutorialFirestoreModels.map((model) {
        final data = model.toJson();
        return Tutorial(
          id: model.id,
          title: localizeField(languageCode, data, 'title'),
          thumbUrl: model.thumbUrl,
          prevTutorialId: model.prevTutorialId,
          nextTutorialId: model.nextTutorialId,
          imageUrl: model.imageUrl,
          content: localizeField(languageCode, data, 'content'),
        );
      }).toList();
    });
  }

  @override
  Future<String?> getNextTutorialId({required String tutorialId}) async {
    final languageCode =
        await _sharedPreferencesService.getPreferredLanguageCode();
    return await _firestoreService.getNextTutorialId(
        tutorialId: tutorialId, languageCode: languageCode);
  }

  @override
  Future<Tutorial> getTutorial(String tutorialId) async {
    final languageCode =
        await _sharedPreferencesService.getPreferredLanguageCode();
    final tutorialFirestoreModel =
        await _firestoreService.getTutorialById(tutorialId, languageCode);
    final data = tutorialFirestoreModel.toJson();
    return Tutorial(
      id: tutorialFirestoreModel.id,
      title: localizeField(languageCode, data, 'title'),
      thumbUrl: tutorialFirestoreModel.thumbUrl,
      imageUrl: tutorialFirestoreModel.imageUrl,
      content: localizeField(languageCode, data, 'content'),
      prevTutorialId: tutorialFirestoreModel.prevTutorialId,
      nextTutorialId: tutorialFirestoreModel.nextTutorialId,
    );
  }

  @override
  void bookmarkTutorial(String tutorialId) {
    _sharedPreferencesService.bookmarkTutorial(tutorialId);
  }
  
  @override
  Future<String?> getBookmarkedTutorialId() async {
    return await _sharedPreferencesService.getBookmarkedTutorialId();
    
  }
}
