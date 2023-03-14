// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_request_step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurveyRequestStep _$SurveyRequestStepFromJson(Map<String, dynamic> json) =>
    SurveyRequestStep(
      id: json['id'] as String?,
      title: json['title'] as String,
      type: $enumDecode(_$RequestTypeEnumMap, json['type'],
          unknownValue: RequestType.text),
      hint: json['hint'] as String?,
      description: json['description'] as String?,
      buttons: (json['buttons'] as List<dynamic>?)
              ?.map((e) => StepButton.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [StepButton.next()],
      backgroundImage: json['backgroundImage'] == null
          ? null
          : StepImage.fromJson(json['backgroundImage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SurveyRequestStepToJson(SurveyRequestStep instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'backgroundImage': instance.backgroundImage,
      'hint': instance.hint,
      'type': _$RequestTypeEnumMap[instance.type]!,
      'buttons': instance.buttons,
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
