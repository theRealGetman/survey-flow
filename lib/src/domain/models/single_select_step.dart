import 'package:survey_flow/survey_flow.dart';

class SingleSelectStep implements SurveyStep {
  const SingleSelectStep({
    required this.title,
    required this.options,
    this.id,
    this.description,
    this.backgroundImage,
  });

  @override
  final String? id;

  @override
  final String title;

  @override
  final String? description;

  final List<SelectOption> options;
  final StepImage? backgroundImage;
}
