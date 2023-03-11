import 'package:survey_flow/survey_flow.dart';

class DateRequestStep implements SurveyStep {
  DateRequestStep({
    this.id,
    required this.title,
    this.description,
    this.buttons = const [
      StepButton.next(),
    ],
    this.backgroundImage,
  });

  @override
  final String? id;

  @override
  final String title;

  @override
  final String? description;

  @override
  final StepImage? backgroundImage;

  final List<StepButton> buttons;
}
