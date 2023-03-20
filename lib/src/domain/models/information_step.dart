import 'package:json_annotation/json_annotation.dart';
import 'package:survey_flow/survey_flow.dart';

part 'information_step.g.dart';

@JsonSerializable()
class InformationStep implements SurveyStep {
  const InformationStep({
    this.id,
    required this.title,
    this.description,
    this.image,
    this.backgroundImage,
    this.primaryButton = const StepButton.next(),
    this.secondaryButton,
    this.buttonsAlignment = ButtonsAlignment.vertical,
  });

  @override
  final String? id;

  @override
  final String title;

  @override
  final String? description;

  @override
  final StepImage? backgroundImage;

  final StepImage? image;
  final StepButton primaryButton;
  final StepButton? secondaryButton;
  @JsonKey(
    unknownEnumValue: ButtonsAlignment.vertical,
  )
  final ButtonsAlignment buttonsAlignment;

  Map<String, dynamic> toJson() => _$InformationStepToJson(this);

  factory InformationStep.fromJson(Map<String, dynamic> json) =>
      _$InformationStepFromJson(json);
}
