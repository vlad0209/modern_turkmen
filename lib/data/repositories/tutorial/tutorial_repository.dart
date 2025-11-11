import 'package:modern_turkmen/domain/models/tutorial/tutorial.dart';

abstract class TutorialRepository {
  Stream<List<Tutorial>> getTutorialsStream();

  Future<String?> getNextTutorialId({required String tutorialId});

  Future<Tutorial> getTutorial(String tutorialId);

  void bookmarkTutorial(String tutorialId);

  Future<String?> getBookmarkedTutorialId();
}