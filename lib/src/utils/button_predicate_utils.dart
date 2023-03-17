import 'package:survey_flow/src/domain/models/button_predicate.dart';

extension ButtonPredicateUtils on ButtonPredicate {
  bool matches(dynamic stepValue) {
    switch (type) {
      case ButtonPredicateType.notEmpty:
        if (stepValue is String?) {
          return stepValue != null &&
              stepValue.isNotEmpty &&
              stepValue.trim().isNotEmpty;
        } else if (stepValue is num?) {
          return stepValue != null && stepValue != 0 && stepValue != 0.0;
        }
        return stepValue != null;
      case ButtonPredicateType.lengthMoreThan:
        if (stepValue is String?) {
          return stepValue != null && stepValue.length > value;
        }
        return false;
      case ButtonPredicateType.matches:
        return RegExp(value).hasMatch(stepValue.toString());
      case ButtonPredicateType.equals:
        if (value is num) {
          stepValue = num.tryParse(stepValue.toString());
        }
        return stepValue == value;
      case ButtonPredicateType.lessThan:
        stepValue = num.tryParse(stepValue.toString());
        return stepValue != null && stepValue < value;
      case ButtonPredicateType.moreThan:
        stepValue = num.tryParse(stepValue.toString());
        return stepValue != null && stepValue > value;
    }
  }
}
