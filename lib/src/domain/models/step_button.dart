import 'package:survey_flow/src/domain/models/step_actions.dart';

class StepButton {
  const StepButton({
    required this.action,
    required this.text,
    this.id,
  });

  const StepButton.next({
    this.id,
    this.text = 'Next',
  }) : action = StepActions.next;

  const StepButton.skip({
    this.id,
    this.text = 'Skip',
  }) : action = StepActions.skip;

  const StepButton.submit({
    this.id,
    this.text = 'Submit',
  }) : action = StepActions.submit;

  final String? id;
  final String text;
  final String action;
}
