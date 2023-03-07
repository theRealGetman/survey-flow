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
}

enum StepButtonStyle { primary, secondary }
