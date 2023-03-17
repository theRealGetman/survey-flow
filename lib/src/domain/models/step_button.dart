import 'package:json_annotation/json_annotation.dart';
import 'package:survey_flow/survey_flow.dart';

part 'step_button.g.dart';

@JsonSerializable()
class StepButton {
  const StepButton({
    required this.action,
    required this.text,
    this.style = StepButtonStyle.primary,
    this.id,
    this.predicate,
    this.navigationConditions,
  });

  const StepButton.next({
    this.id,
    this.text = 'Next',
    this.style = StepButtonStyle.primary,
    this.predicate,
    this.navigationConditions,
  }) : action = StepActions.next;

  const StepButton.skip({
    this.id,
    this.text = 'Skip',
    this.style = StepButtonStyle.secondary,
    this.predicate,
    this.navigationConditions,
  }) : action = StepActions.skip;

  const StepButton.submit({
    this.id,
    this.text = 'Submit',
    this.style = StepButtonStyle.primary,
    this.predicate,
    this.navigationConditions,
  }) : action = StepActions.submit;

  final String? id;
  final String text;
  final String action;
  @JsonKey(
    unknownEnumValue: StepButtonStyle.primary,
  )
  final StepButtonStyle style;

  /// if request screen value matches pattern, primary button would be enabled
  final ButtonPredicate? predicate;
  final List<ButtonNavigationCondition>? navigationConditions;

  Map<String, dynamic> toJson() => _$StepButtonToJson(this);

  factory StepButton.fromJson(Map<String, dynamic> json) =>
      _$StepButtonFromJson(json);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StepButton &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          text == other.text &&
          action == other.action &&
          style == other.style &&
          predicate == other.predicate &&
          navigationConditions == other.navigationConditions;

  @override
  int get hashCode =>
      id.hashCode ^
      text.hashCode ^
      action.hashCode ^
      style.hashCode ^
      predicate.hashCode ^
      navigationConditions.hashCode;
}

enum StepButtonStyle { primary, secondary }
