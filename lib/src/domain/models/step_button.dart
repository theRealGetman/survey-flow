import 'package:survey_flow/src/domain/models/step_actions.dart';

class StepButton {
  const StepButton({
    required this.action,
    required this.text,
    this.style = StepButtonStyle.primary,
    this.id,
  });

  const StepButton.next({
    this.id,
    this.text = 'Next',
    this.style = StepButtonStyle.primary,
  }) : action = StepActions.next;

  const StepButton.skip({
    this.id,
    this.text = 'Skip',
    this.style = StepButtonStyle.primary,
  }) : action = StepActions.skip;

  const StepButton.submit({
    this.id,
    this.text = 'Submit',
    this.style = StepButtonStyle.primary,
  }) : action = StepActions.submit;

  final String? id;
  final String text;
  final String action;
  final StepButtonStyle style;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StepButton &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          text == other.text &&
          action == other.action;

  @override
  int get hashCode => id.hashCode ^ text.hashCode ^ action.hashCode;
}

enum StepButtonStyle { primary, secondary }
