import 'package:json_annotation/json_annotation.dart';
import 'package:survey_flow/src/domain/models/models.dart';

part 'unknown_step.g.dart';

@JsonSerializable()
class UnknownStep implements SurveyStep {
  const UnknownStep({
    required this.title,
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

  @override
  final StepImage? backgroundImage;

  Map<String, dynamic> toJson() => _$UnknownStepToJson(this);

  factory UnknownStep.fromJson(Map<String, dynamic> json) =>
      _$UnknownStepFromJson(json);
}
