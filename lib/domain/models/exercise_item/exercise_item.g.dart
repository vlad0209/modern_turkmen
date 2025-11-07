// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExerciseItem _$ExerciseItemFromJson(Map<String, dynamic> json) =>
    _ExerciseItem(
      options:
          (json['options'] as List<dynamic>).map((e) => e as String).toList(),
      sentence: json['sentence'] as String,
      sound: json['sound'] as String?,
      translation: json['translation'] as String,
      solution: json['solution'] as String,
    );

Map<String, dynamic> _$ExerciseItemToJson(_ExerciseItem instance) =>
    <String, dynamic>{
      'options': instance.options,
      'sentence': instance.sentence,
      'sound': instance.sound,
      'translation': instance.translation,
      'solution': instance.solution,
    };
