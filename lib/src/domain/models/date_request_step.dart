import 'package:survey_flow/src/domain/models/step_button.dart';
import 'package:survey_flow/src/domain/models/survey_step.dart';

class DateRequestStep implements SurveyStep {
  DateRequestStep({
    this.id,
    required this.title,
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
