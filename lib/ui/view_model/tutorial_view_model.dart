import 'package:modern_turkmen/data/repositories/exercise/exercise_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../config/dependencies.dart';
import '../../data/repositories/tutorial/tutorial_repository.dart';
import '../ui_state/tutorial_ui_state.dart';

part 'tutorial_view_model.g.dart';

@riverpod
class TutorialViewModel extends _$TutorialViewModel {
  late TutorialRepository _tutorialRepository;
  late ExerciseRepository _exerciseRepository;

  @override
  FutureOr<TutorialUiState> build(String tutorialId) async {
    _tutorialRepository = ref.watch(tutorialRepositoryProvider);
    _exerciseRepository = ref.watch(exerciseRepositoryProvider);
    final tutorial = await _tutorialRepository.getTutorial(tutorialId);
    _tutorialRepository.bookmarkTutorial(tutorialId);
    final exerciseId = await _exerciseRepository.getFirstExerciseId(tutorialId);

    return TutorialUiState(
        tutorial: tutorial,
        exerciseId: exerciseId);
  }
}
