import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:modern_turkmen/domain/models/tutorial/tutorial.dart';

part 'tutorial_ui_state.freezed.dart';

@freezed
abstract class TutorialUiState with _$TutorialUiState {
  const factory TutorialUiState(
      {required Tutorial tutorial,
      required String? exerciseId}) = _TutorialUiState;
}
