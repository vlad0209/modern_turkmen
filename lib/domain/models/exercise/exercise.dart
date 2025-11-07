import 'package:freezed_annotation/freezed_annotation.dart';

import '../exercise_item/exercise_item.dart';

part 'exercise.g.dart';
part 'exercise.freezed.dart';

@freezed
abstract class Exercise with _$Exercise {
  const factory Exercise({
    required String id,
    required List<ExerciseItem>? items,
    required String? description,
    required String? exampleTranslation,
    required String? example,
  }) = _Exercise;
  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);
}