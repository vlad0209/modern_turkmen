import 'package:freezed_annotation/freezed_annotation.dart';

part 'tutorial.freezed.dart';
part 'tutorial.g.dart';


@freezed
abstract class Tutorial with _$Tutorial {
  const factory Tutorial({
    required String id,
    required String title,
    required String? thumbUrl,
    required String? imageUrl,
    required String? content,
    required String? prevTutorialId,
    required String? nextTutorialId,
  }) = _Tutorial;
  factory Tutorial.fromJson(Map<String, dynamic> json) =>
      _$TutorialFromJson(json);
}