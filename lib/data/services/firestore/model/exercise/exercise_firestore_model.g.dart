// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_firestore_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExerciseFirestoreModel _$ExerciseFirestoreModelFromJson(
        Map<String, dynamic> json) =>
    _ExerciseFirestoreModel(
      id: json['id'] as String,
      description: json['description'] as String,
      example: json['example'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      orderNumber: (json['order_number'] as num).toInt(),
      exampleTranslation: json['example_translation'] as String?,
    );

Map<String, dynamic> _$ExerciseFirestoreModelToJson(
        _ExerciseFirestoreModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'example': instance.example,
      'items': instance.items,
      'order_number': instance.orderNumber,
      'example_translation': instance.exampleTranslation,
    };
