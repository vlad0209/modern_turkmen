import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:modern_turkmen/domain/models/exercise/exercise.dart';

part 'exercise_ui_state.freezed.dart';

@freezed
abstract class ExerciseUiState with _$ExerciseUiState {
  const factory ExerciseUiState({
    required Exercise exercise,
    required int itemIndex,
    required String sentence,
    required List<String> options,
    required Future? soundFuture,
    required bool isPlayingAudio,
    required List<int> notSolvedItems,
    required List<int> solvedItems,
    required List<int> passedItems,
    required bool checking
  }) = _ExerciseUiState;
}
