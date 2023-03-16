import 'package:json_annotation/json_annotation.dart';

part 'button_predicate.g.dart';

@JsonSerializable()
class ButtonPredicate {
  const ButtonPredicate({
    required this.type,
    this.value,
  });

  const ButtonPredicate.notEmpty()
      : value = null,
        type = ButtonPredicateType.notEmpty;

  const ButtonPredicate.lengthMoreThan(int length)
      : value = length,
        type = ButtonPredicateType.lengthMoreThan;

  const ButtonPredicate.matches(String pattern)
      : value = pattern,
        type = ButtonPredicateType.matches;

  const ButtonPredicate.equals(this.value) : type = ButtonPredicateType.equals;

  const ButtonPredicate.lessThan(num this.value)
      : type = ButtonPredicateType.lessThan;

  const ButtonPredicate.moreThan(num this.value)
      : type = ButtonPredicateType.moreThan;

  final dynamic value;
  final ButtonPredicateType type;

  factory ButtonPredicate.fromJson(Map<String, dynamic> json) =>
      _$ButtonPredicateFromJson(json);

  Map<String, dynamic> toJson() => _$ButtonPredicateToJson(this);
}

enum ButtonPredicateType {
  notEmpty,
  lengthMoreThan,
  matches,
  equals,
  lessThan,
  moreThan,
}
