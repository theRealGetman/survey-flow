import 'package:survey_flow/survey_flow.dart';

class TextRequestStep extends SurveyRequestStep {
  const TextRequestStep({
    required super.title,
    super.id,
    super.description,
    super.buttons = const [
      StepButton.next(),
    ],
    super.backgroundImage,
    super.type = RequestType.text,
    super.hint,
  });
}
