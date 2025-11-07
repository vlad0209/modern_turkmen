import 'package:modern_turkmen/data/repositories/tutorial/tutorial_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../config/dependencies.dart';
import '../../data/repositories/audio/audio_repository.dart';
import '../../data/repositories/exercise/exercise_repository.dart';
import '../ui_state/exercise_ui_state.dart';

part 'exercise_view_model.g.dart';

class ExerciseViewModelParams {
  final String tutorialId;
  final String languageCode;
  final String exerciseId;

  ExerciseViewModelParams(
      {required this.tutorialId,
      required this.languageCode,
      required this.exerciseId});
}

@riverpod
class ExerciseViewModel extends _$ExerciseViewModel {
  late ExerciseRepository _exerciseRepository;
  late AudioRepository _audioRepository;
  late TutorialRepository _tutorialRepository;
  @override
  FutureOr<ExerciseUiState> build(ExerciseViewModelParams params) async {
    _exerciseRepository = ref.watch(exerciseRepositoryProvider);
    _audioRepository = ref.watch(audioRepositoryProvider);
    _tutorialRepository = ref.watch(tutorialRepositoryProvider);
    final exercise = await _exerciseRepository.getExercise(
        tutorialId: params.tutorialId,
        languageCode: params.languageCode,
        exerciseId: params.exerciseId);
    exercise.items?[0].options.shuffle();
    final url = exercise.items?[0].sound;
    Future? soundFuture;
    if (url != null) {
      soundFuture = _audioRepository.setSourceUrl(url);
    }
    return ExerciseUiState(
        checking: false,
        exercise: exercise,
        itemIndex: 0,
        sentence: exercise.items?[0].sentence ?? '',
        options: exercise.items?[0].options ?? [],
        notSolvedItems: [],
        soundFuture: soundFuture,
        solvedItems: [],
        passedItems: [],
        isPlayingAudio: false);
  }

  void listenOnPlayingCompleted(void Function(void)? onCompleted) {
    state = AsyncData(state.value!.copyWith(isPlayingAudio: false));
    _audioRepository.onPlayingCompleted.listen(onCompleted);
  }

  void pauseAudio() {
    _audioRepository.pauseAudio();
    state = AsyncData(state.value!.copyWith(isPlayingAudio: false));
  }

  void resumeAudio() {
    _audioRepository.resumeAudio();
    state = AsyncData(state.value!.copyWith(isPlayingAudio: true));
  }

  void chooseWord(String word) {
    state = AsyncData(state.value!.copyWith(
      sentence: state.value!.sentence.replaceFirst('<f/>', '<f>$word</f>'),
      options: state.value!.options.where((option) => option != word).toList(),
    ));
  }

  void markItemAsNotSolved() {
    final itemIndex = state.value!.itemIndex;
    final notSolvedItems = state.value!.notSolvedItems;
    if (!notSolvedItems.contains(itemIndex)) {
      notSolvedItems.add(itemIndex);
      state = AsyncData(state.value!.copyWith(notSolvedItems: notSolvedItems));
    }
  }

  void markItemAsPassed() {
    final notSolvedItems = state.value!.notSolvedItems;
    final itemIndex = state.value!.itemIndex;
    final solvedItems = state.value!.solvedItems;
    final passedItems = state.value!.passedItems;
    if (!notSolvedItems.contains(itemIndex)) {
      solvedItems.add(itemIndex);
      passedItems.add(itemIndex);
    } else {
      passedItems.add(itemIndex);
    }

    state = AsyncData(state.value!.copyWith(
      solvedItems: solvedItems,
      passedItems: passedItems,
    ));
  }

  bool hasNextItem() =>
      state.value!.itemIndex < state.value!.exercise.items!.length - 1;

  void goToNextItem() {
    Future.delayed(const Duration(seconds: 2), () {
      final uiState = state.value!;
      final itemIndex = uiState.itemIndex + 1;
      uiState.exercise.items?[itemIndex].options.shuffle();
      final newUiState = uiState.copyWith(
          itemIndex: uiState.itemIndex,
          sentence: uiState.exercise.items?[itemIndex].sentence ?? '',
          options: List.from(uiState.exercise.items?[itemIndex].options ?? []),
          isPlayingAudio: false,
          soundFuture: _audioRepository
              .setSourceUrl(uiState.exercise.items?[itemIndex].sound ?? ''),
          checking: false);
      state = AsyncData(newUiState);
    });
  }

  Future<String?> getNextExerciseId() {
    return _exerciseRepository.getNextExerciseId(
        tutorialId: params.tutorialId,
        languageCode: params.languageCode,
        currentExerciseId: params.exerciseId);
  }

  Future<String?> getNextTutorialId() {
    return _tutorialRepository.getNextTutorialId(tutorialId: params.tutorialId);
  }
}
