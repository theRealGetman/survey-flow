import 'package:survey_flow/src/domain/models/select_option.dart';
import 'package:survey_flow/src/domain/models/survey_step.dart';

class SingleSelectStep implements SurveyStep {
  SingleSelectStep({
    required this.title,
    required this.options,
    this.id,
    this.description,
  });

  @override
  final String? id;

  @override
  final String title;

  @override
  final String? description;

  final List<SelectOption> options;
}
