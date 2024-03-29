import 'package:flutter/material.dart';
import 'package:survey_flow/src/domain/models/models.dart';

typedef ButtonPressedCallback = Function(
  StepButton button, [
  StepResult? result,
]);

/// should return next step action this custom action was handled
/// for example StepActions.next
typedef CustomActionCallback = Future<String> Function([StepResult? result]);
typedef CustomWidgetBuilder = Widget? Function(
  BuildContext context,
  SurveyStep step,
  ButtonPressedCallback onPressed,
);

typedef InputDecorationBuilder = InputDecoration Function(
  BuildContext context,
  SurveyRequestStep step,
);
