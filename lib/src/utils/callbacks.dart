import 'package:survey_flow/src/domain/models/models.dart';

typedef ButtonPressedCallback = Function(
  StepButton button, [
  StepResult? result,
]);

/// should return next step action this custom action was handled
/// for example StepActions.next
typedef CustomActionCallback = Future<String> Function([StepResult? result]);
