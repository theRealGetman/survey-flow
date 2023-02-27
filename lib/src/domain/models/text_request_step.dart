import 'package:survey_flow/src/domain/models/step_button.dart';
import 'package:survey_flow/src/domain/models/survey_step.dart';

class TextRequestStep implements SurveyStep {
  const TextRequestStep({
    required this.title,
    this.id,
    this.description,
    this.buttons = const [
      StepButton.next(),
    ],
  });

  @override
  final String? id;

  @override
  final String title;

  @override
  final String? description;

  final List<StepButton> buttons;
}