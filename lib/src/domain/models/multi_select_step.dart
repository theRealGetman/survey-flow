import 'package:survey_flow/src/domain/models/select_option.dart';
import 'package:survey_flow/src/domain/models/step_button.dart';
import 'package:survey_flow/src/domain/models/survey_step.dart';

class MultiSelectStep implements SurveyStep {
  const MultiSelectStep({
    this.id,
    required this.title,
    required this.options,
    this.description,
    this.minimumAmountOfOptionsSelected,
    this.maximumAmountOfOptionsSelected,
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

  final List<SelectOption> options;

  final List<StepButton> buttons;

  final int? minimumAmountOfOptionsSelected;

  final int? maximumAmountOfOptionsSelected;
}
