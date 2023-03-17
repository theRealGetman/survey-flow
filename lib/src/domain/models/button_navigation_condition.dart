import 'package:json_annotation/json_annotation.dart';

part 'button_navigation_condition.g.dart';

@JsonSerializable()
class ButtonNavigationCondition {
  const ButtonNavigationCondition({
    required this.nextStepId,
    this.type = ButtonNavigationConditionType.nextStep,
    this.value,
  });

  const ButtonNavigationCondition.nextStep(this.nextStepId)
      : value = null,
        type = ButtonNavigationConditionType.nextStep;

  const ButtonNavigationCondition.notEmpty(this.nextStepId)
      : value = null,
        type = ButtonNavigationConditionType.notEmpty;

  const ButtonNavigationCondition.lengthMoreThan(this.nextStepId, int length)
      : value = length,
        type = ButtonNavigationConditionType.lengthMoreThan;

  const ButtonNavigationCondition.matches(this.nextStepId, String pattern)
      : value = pattern,
        type = ButtonNavigationConditionType.matches;

  const ButtonNavigationCondition.equals(this.nextStepId, this.value)
      : type = ButtonNavigationConditionType.equals;

  const ButtonNavigationCondition.lessThan(this.nextStepId, num this.value)
      : type = ButtonNavigationConditionType.lessThan;

  const ButtonNavigationCondition.moreThan(this.nextStepId, num this.value)
      : type = ButtonNavigationConditionType.moreThan;

  final dynamic value;
  final ButtonNavigationConditionType type;
  final String nextStepId;

  factory ButtonNavigationCondition.fromJson(Map<String, dynamic> json) =>
      _$ButtonNavigationConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ButtonNavigationConditionToJson(this);
}

enum ButtonNavigationConditionType {
  nextStep,
  notEmpty,
  lengthMoreThan,
  matches,
  equals,
  lessThan,
  moreThan,
}
