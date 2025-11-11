import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_ui_state.freezed.dart';

@freezed
abstract class AppUiState with _$AppUiState {
  const factory AppUiState({
    required String preferredLanguage,
    required String? bookmarkedTutorialId,
    required bool isFirstLaunch,
  }) = _AppUiState;
}