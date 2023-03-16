// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'button_predicate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ButtonPredicate _$ButtonPredicateFromJson(Map<String, dynamic> json) =>
    ButtonPredicate(
      type: $enumDecode(_$ButtonPredicateTypeEnumMap, json['type']),
      value: json['value'],
    );

Map<String, dynamic> _$ButtonPredicateToJson(ButtonPredicate instance) =>
    <String, dynamic>{
      'value': instance.value,
      'type': _$ButtonPredicateTypeEnumMap[instance.type]!,
    };

const _$ButtonPredicateTypeEnumMap = {
  ButtonPredicateType.notEmpty: 'notEmpty',
  ButtonPredicateType.lengthMoreThan: 'lengthMoreThan',
  ButtonPredicateType.matches: 'matches',
  ButtonPredicateType.equals: 'equals',
  ButtonPredicateType.lessThan: 'lessThan',
  ButtonPredicateType.moreThan: 'moreThan',
};
