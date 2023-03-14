// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_select_step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleSelectStep _$SingleSelectStepFromJson(Map<String, dynamic> json) =>
    SingleSelectStep(
      title: json['title'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => SelectOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
      description: json['description'] as String?,
      backgroundImage: json['backgroundImage'] == null
          ? null
          : StepImage.fromJson(json['backgroundImage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SingleSelectStepToJson(SingleSelectStep instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'options': instance.options,
      'backgroundImage': instance.backgroundImage,
    };
