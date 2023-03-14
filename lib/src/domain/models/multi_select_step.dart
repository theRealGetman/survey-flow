import 'package:json_annotation/json_annotation.dart';
import 'package:survey_flow/survey_flow.dart';

part 'multi_select_step.g.dart';

@JsonSerializable()
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

  @override
  final StepImage? backgroundImage;

  final List<SelectOption> options;
  final StepButton primaryButton;
  final int? minimumAmountOfOptionsSelected;
  final int? maximumAmountOfOptionsSelected;

  Map<String, dynamic> toJson() => _$MultiSelectStepToJson(this);

  factory MultiSelectStep.fromJson(Map<String, dynamic> json) =>
      _$MultiSelectStepFromJson(json);
}
