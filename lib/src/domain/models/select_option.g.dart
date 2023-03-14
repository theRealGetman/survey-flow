// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelectOption _$SelectOptionFromJson(Map<String, dynamic> json) => SelectOption(
      text: json['text'] as String,
      value: json['value'],
      id: json['id'] as String?,
      description: json['description'] as String?,
      action: json['action'] as String? ?? StepActions.next,
    );

Map<String, dynamic> _$SelectOptionToJson(SelectOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'action': instance.action,
      'description': instance.description,
      'value': instance.value,
    };
