// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomSurveyStep _$CustomSurveyStepFromJson(Map<String, dynamic> json) =>
    CustomSurveyStep(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      primaryButton:
          StepButton.fromJson(json['primaryButton'] as Map<String, dynamic>),
      image: StepImage.fromJson(json['image'] as Map<String, dynamic>),
      backgroundImage: json['backgroundImage'] == null
          ? null
          : StepImage.fromJson(json['backgroundImage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CustomSurveyStepToJson(CustomSurveyStep instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'backgroundImage': instance.backgroundImage,
      'image': instance.image,
      'primaryButton': instance.primaryButton,
    };
