import 'package:survey_flow/survey_flow.dart';

class MultiSelectStep implements SurveyStep {
  const MultiSelectStep({
    this.id,
    required this.title,
    required this.options,
    this.description,
    this.minimumAmountOfOptionsSelected,
    this.maximumAmountOfOptionsSelected,
    this.backgroundImage,
    this.primaryButton = const StepButton.next(),
  });

  @override
  final String? id;

  @override
  final String title;

  @override
  final String? description;

  final List<SelectOption> options;
  final StepButton primaryButton;
  final int? minimumAmountOfOptionsSelected;
  final int? maximumAmountOfOptionsSelected;
  final StepImage? backgroundImage;
}
