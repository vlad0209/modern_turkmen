import 'package:freezed_annotation/freezed_annotation.dart';

import '../timestamp_converter.dart';

part 'tutorial_firestore_model.g.dart';
part 'tutorial_firestore_model.freezed.dart';

@freezed
abstract class TutorialFirestoreModel with _$TutorialFirestoreModel {
  const factory TutorialFirestoreModel({
    required String id,
    @JsonKey(name: 'content_en') required String contentEn,
    @JsonKey(name: 'content_ru') required String contentRu,
    @JsonKey(name: 'created_at', fromJson: timeFromJson, toJson: timeToJson) required DateTime createdAt,
    @JsonKey(name: 'image_url') required String imageUrl,
    @JsonKey(name: 'index') required int index,
    @JsonKey(name: 'public_en') required bool publicEn,
    @JsonKey(name: 'public_ru') required bool publicRu,
    @JsonKey(name: 'thumb_url') required String thumbUrl,
    @JsonKey(name: 'title_en') required String titleEn,
    @JsonKey(name: 'title_ru') required String titleRu,
    String? prevTutorialId,
    String? nextTutorialId,
  }) = _TutorialFirestoreModel;

  factory TutorialFirestoreModel.fromJson(Map<String, dynamic> json) =>
      _$TutorialFirestoreModelFromJson(json);

  
}