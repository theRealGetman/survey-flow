// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multi_select_step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MultiSelectStep _$MultiSelectStepFromJson(Map<String, dynamic> json) =>
    MultiSelectStep(
      id: json['id'] as String?,
      title: json['title'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => SelectOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      minimumAmountOfOptionsSelected:
          json['minimumAmountOfOptionsSelected'] as int?,
      maximumAmountOfOptionsSelected:
          json['maximumAmountOfOptionsSelected'] as int?,
      backgroundImage: json['backgroundImage'] == null
          ? null
          : StepImage.fromJson(json['backgroundImage'] as Map<String, dynamic>),
      primaryButton: json['primaryButton'] == null
          ? const StepButton.next()
          : StepButton.fromJson(json['primaryButton'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MultiSelectStepToJson(MultiSelectStep instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'backgroundImage': instance.backgroundImage,
      'options': instance.options,
      'primaryButton': instance.primaryButton,
      'minimumAmountOfOptionsSelected': instance.minimumAmountOfOptionsSelected,
      'maximumAmountOfOptionsSelected': instance.maximumAmountOfOptionsSelected,
    };
