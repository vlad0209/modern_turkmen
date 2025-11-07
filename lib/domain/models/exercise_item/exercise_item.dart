import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise_item.freezed.dart';
part 'exercise_item.g.dart';

@freezed
abstract class ExerciseItem with _$ExerciseItem {
  const factory ExerciseItem({
    required List<String> options,
    required String sentence,
    required String? sound,
    required String translation,
    required String solution,
  }) = _ExerciseItem;
  factory ExerciseItem.fromJson(Map<String, dynamic> json) =>
      _$ExerciseItemFromJson(json);
}