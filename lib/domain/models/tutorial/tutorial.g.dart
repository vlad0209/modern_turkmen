// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutorial.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Tutorial _$TutorialFromJson(Map<String, dynamic> json) => _Tutorial(
      id: json['id'] as String,
      title: json['title'] as String,
      thumbUrl: json['thumbUrl'] as String?,
      imageUrl: json['imageUrl'] as String?,
      content: json['content'] as String?,
      prevTutorialId: json['prevTutorialId'] as String?,
      nextTutorialId: json['nextTutorialId'] as String?,
    );

Map<String, dynamic> _$TutorialToJson(_Tutorial instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'thumbUrl': instance.thumbUrl,
      'imageUrl': instance.imageUrl,
      'content': instance.content,
      'prevTutorialId': instance.prevTutorialId,
      'nextTutorialId': instance.nextTutorialId,
    };
