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
      buttons: (json['buttons'] as List<dynamic>?)
              ?.map((e) => StepButton.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [StepButton.next()],
    );

Map<String, dynamic> _$InformationStepToJson(InformationStep instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'backgroundImage': instance.backgroundImage,
      'image': instance.image,
      'buttons': instance.buttons,
    };
