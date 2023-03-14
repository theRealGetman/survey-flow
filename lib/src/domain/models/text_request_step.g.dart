// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_request_step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextRequestStep _$TextRequestStepFromJson(Map<String, dynamic> json) =>
    TextRequestStep(
      title: json['title'] as String,
      id: json['id'] as String?,
      description: json['description'] as String?,
      buttons: (json['buttons'] as List<dynamic>?)
              ?.map((e) => StepButton.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [StepButton.next()],
      backgroundImage: json['backgroundImage'] == null
          ? null
          : StepImage.fromJson(json['backgroundImage'] as Map<String, dynamic>),
      type: $enumDecodeNullable(_$RequestTypeEnumMap, json['type'],
              unknownValue: RequestType.text) ??
          RequestType.text,
      hint: json['hint'] as String?,
    );

Map<String, dynamic> _$TextRequestStepToJson(TextRequestStep instance) =>
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
