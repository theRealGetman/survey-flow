import 'package:survey_flow/survey_flow.dart';

class NumberRequestStep extends SurveyRequestStep {
  const NumberRequestStep({
    required super.title,
    super.id,
    super.description,
    super.buttons = const [
      StepButton.next(),
    ],
    super.backgroundImage,
    super.type = RequestType.numberInt,
    super.hint,
  });
}
