import 'package:survey_flow/src/domain/models/button_navigation_condition.dart';

extension ButtonNavigationConditionListUtils
    on List<ButtonNavigationCondition> {
  String? evaluate(dynamic stepResultValue) {
    for (ButtonNavigationCondition condition in this) {
      if (condition.matches(stepResultValue)) {
        return condition.nextStepId;
      }
    }
    return null;
  }
}

extension ButtonNavigationConditionUtils on ButtonNavigationCondition {
  bool matches(dynamic stepResultValue) {
    switch (type) {
      case ButtonNavigationConditionType.nextStep:
        return true;
      case ButtonNavigationConditionType.notEmpty:
        if (stepResultValue is String?) {
          return stepResultValue != null &&
              stepResultValue.isNotEmpty &&
              stepResultValue.trim().isNotEmpty;
        } else if (stepResultValue is num?) {
          return stepResultValue != null &&
              stepResultValue != 0 &&
              stepResultValue != 0.0;
        }
        return stepResultValue != null;
      case ButtonNavigationConditionType.lengthMoreThan:
        if (stepResultValue is String?) {
          return stepResultValue != null && stepResultValue.length > value;
        }
        return false;
      case ButtonNavigationConditionType.matches:
        return RegExp(value).hasMatch(stepResultValue.toString());
      case ButtonNavigationConditionType.equals:
        if (value is num) {
          stepResultValue = num.tryParse(stepResultValue.toString());
        }
        return stepResultValue == value;
      case ButtonNavigationConditionType.lessThan:
        stepResultValue = num.tryParse(stepResultValue.toString());
        return stepResultValue != null && stepResultValue < value;
      case ButtonNavigationConditionType.moreThan:
        stepResultValue = num.tryParse(stepResultValue.toString());
        return stepResultValue != null && stepResultValue > value;
    }
  }
}
