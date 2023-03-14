// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_request_step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DateRequestStep _$DateRequestStepFromJson(Map<String, dynamic> json) =>
    DateRequestStep(
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
          RequestType.date,
      hint: json['hint'] as String?,
      dateFormat: json['dateFormat'] as String?,
    );

Map<String, dynamic> _$DateRequestStepToJson(DateRequestStep instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'backgroundImage': instance.backgroundImage,
      'hint': instance.hint,
      'type': _$RequestTypeEnumMap[instance.type]!,
      'buttons': instance.buttons,
      'dateFormat': instance.dateFormat,
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
