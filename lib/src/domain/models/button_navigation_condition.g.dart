// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'button_navigation_condition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ButtonNavigationCondition _$ButtonNavigationConditionFromJson(
        Map<String, dynamic> json) =>
    ButtonNavigationCondition(
      nextStepId: json['nextStepId'] as String,
      type: $enumDecodeNullable(
              _$ButtonNavigationConditionTypeEnumMap, json['type']) ??
          ButtonNavigationConditionType.nextStep,
      value: json['value'],
    );

Map<String, dynamic> _$ButtonNavigationConditionToJson(
        ButtonNavigationCondition instance) =>
    <String, dynamic>{
      'value': instance.value,
      'type': _$ButtonNavigationConditionTypeEnumMap[instance.type]!,
      'nextStepId': instance.nextStepId,
    };

const _$ButtonNavigationConditionTypeEnumMap = {
  ButtonNavigationConditionType.nextStep: 'nextStep',
  ButtonNavigationConditionType.notEmpty: 'notEmpty',
  ButtonNavigationConditionType.lengthMoreThan: 'lengthMoreThan',
  ButtonNavigationConditionType.matches: 'matches',
  ButtonNavigationConditionType.equals: 'equals',
  ButtonNavigationConditionType.lessThan: 'lessThan',
  ButtonNavigationConditionType.moreThan: 'moreThan',
};
