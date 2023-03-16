// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'information_step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InformationStep _$InformationStepFromJson(Map<String, dynamic> json) =>
    InformationStep(
      id: json['id'] as String?,
      title: json['title'] as String,
      description: json['description'] as String?,
      image: json['image'] == null
          ? null
          : StepImage.fromJson(json['image'] as Map<String, dynamic>),
      backgroundImage: json['backgroundImage'] == null
          ? null
          : StepImage.fromJson(json['backgroundImage'] as Map<String, dynamic>),
      primaryButton: json['primaryButton'] == null
          ? const StepButton.next()
          : StepButton.fromJson(json['primaryButton'] as Map<String, dynamic>),
      secondaryButton: json['secondaryButton'] == null
          ? null
          : StepButton.fromJson(
              json['secondaryButton'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InformationStepToJson(InformationStep instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'backgroundImage': instance.backgroundImage,
      'image': instance.image,
      'primaryButton': instance.primaryButton,
      'secondaryButton': instance.secondaryButton,
    };
