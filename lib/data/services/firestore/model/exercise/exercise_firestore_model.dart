import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise_firestore_model.g.dart';
part 'exercise_firestore_model.freezed.dart';

@freezed
abstract class ExerciseFirestoreModel with _$ExerciseFirestoreModel {
  const factory ExerciseFirestoreModel({
    required String id,
    required String description,
    required String example,
    required List<Map<String, dynamic>> items,
    @JsonKey(name: 'order_number') required int orderNumber,
    @JsonKey(name: 'example_translation') String? exampleTranslation,
  }) = _ExerciseFirestoreModel;
  factory ExerciseFirestoreModel.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFirestoreModelFromJson(json);
}