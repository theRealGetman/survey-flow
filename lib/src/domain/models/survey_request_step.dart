import 'package:survey_flow/survey_flow.dart';

class SurveyRequestStep implements SurveyStep {
  const SurveyRequestStep({
    this.id,
    required this.title,
    required this.type,
    this.hint,
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

  final String? hint;
  final RequestType type;
  final List<StepButton> buttons;
}

enum RequestType {
  text,
  textMultiline,
  name,
  email,
  numberInt,
  numberDouble,
  date,
  time,
  dateAndTime,
}
