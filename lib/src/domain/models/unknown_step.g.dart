// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unknown_step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnknownStep _$UnknownStepFromJson(Map<String, dynamic> json) => UnknownStep(
      title: json['title'] as String,
      id: json['id'] as String?,
      description: json['description'] as String?,
      backgroundImage: json['backgroundImage'] == null
          ? null
          : StepImage.fromJson(json['backgroundImage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UnknownStepToJson(UnknownStep instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'backgroundImage': instance.backgroundImage,
    };
