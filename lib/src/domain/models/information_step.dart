import 'package:survey_flow/survey_flow.dart';

class InformationStep implements SurveyStep {
  const InformationStep({
    this.id,
    required this.title,
    this.description,
    this.image,
    this.backgroundImage,
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

  final StepImage? image;
  final StepImage? backgroundImage;
  final List<StepButton> buttons;
}
