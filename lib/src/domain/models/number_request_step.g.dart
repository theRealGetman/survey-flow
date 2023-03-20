// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'number_request_step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NumberRequestStep _$NumberRequestStepFromJson(Map<String, dynamic> json) =>
    NumberRequestStep(
      title: json['title'] as String,
      id: json['id'] as String?,
      description: json['description'] as String?,
      primaryButton: json['primaryButton'] == null
          ? const StepButton.next()
          : StepButton.fromJson(json['primaryButton'] as Map<String, dynamic>),
      secondaryButton: json['secondaryButton'] == null
          ? null
          : StepButton.fromJson(
              json['secondaryButton'] as Map<String, dynamic>),
      backgroundImage: json['backgroundImage'] == null
          ? null
          : StepImage.fromJson(json['backgroundImage'] as Map<String, dynamic>),
      type: $enumDecodeNullable(_$RequestTypeEnumMap, json['type'],
              unknownValue: RequestType.text) ??
          RequestType.numberInt,
      hint: json['hint'] as String?,
      buttonsAlignment: $enumDecodeNullable(
              _$ButtonsAlignmentEnumMap, json['buttonsAlignment'],
              unknownValue: ButtonsAlignment.vertical) ??
          ButtonsAlignment.vertical,
    );

Map<String, dynamic> _$NumberRequestStepToJson(NumberRequestStep instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'backgroundImage': instance.backgroundImage,
      'hint': instance.hint,
      'type': _$RequestTypeEnumMap[instance.type]!,
      'primaryButton': instance.primaryButton,
      'secondaryButton': instance.secondaryButton,
      'buttonsAlignment': _$ButtonsAlignmentEnumMap[instance.buttonsAlignment]!,
    };

const _$RequestTypeEnumMap = {
  RequestType.text: 'text',
  RequestType.textMultiline: 'textMultiline',
  RequestType.name: 'name',
  RequestType.email: 'email',
  RequestType.numberInt: 'numberInt',
  RequestType.numberDouble: 'numberDouble',
  RequestType.date: 'date',
  RequestType.time: 'time',
  RequestType.dateAndTime: 'dateAndTime',
};

const _$ButtonsAlignmentEnumMap = {
  ButtonsAlignment.vertical: 'vertical',
  ButtonsAlignment.horizontal: 'horizontal',
};
