// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_button.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StepButton _$StepButtonFromJson(Map<String, dynamic> json) => StepButton(
      action: json['action'] as String,
      text: json['text'] as String,
      style: $enumDecodeNullable(_$StepButtonStyleEnumMap, json['style'],
              unknownValue: StepButtonStyle.primary) ??
          StepButtonStyle.primary,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$StepButtonToJson(StepButton instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'action': instance.action,
      'style': _$StepButtonStyleEnumMap[instance.style]!,
    };

const _$StepButtonStyleEnumMap = {
  StepButtonStyle.primary: 'primary',
  StepButtonStyle.secondary: 'secondary',
};
