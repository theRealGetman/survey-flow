import 'package:json_annotation/json_annotation.dart';
import 'package:survey_flow/survey_flow.dart';

part 'single_select_step.g.dart';

@JsonSerializable()
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

  @override
  final StepImage? backgroundImage;

  Map<String, dynamic> toJson() => _$SingleSelectStepToJson(this);

  factory SingleSelectStep.fromJson(Map<String, dynamic> json) =>
      _$SingleSelectStepFromJson(json);
}
