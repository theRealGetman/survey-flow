import 'package:json_annotation/json_annotation.dart';
import 'package:survey_flow/survey_flow.dart';

part 'number_request_step.g.dart';

@JsonSerializable()
class NumberRequestStep extends SurveyRequestStep {
  const NumberRequestStep({
    required super.title,
    super.id,
    super.description,
    super.buttons = const [
      StepButton.next(),
    ],
    super.backgroundImage,
    super.type = RequestType.numberInt,
    super.hint,
  });

  @override
  Map<String, dynamic> toJson() => _$NumberRequestStepToJson(this);

  factory NumberRequestStep.fromJson(Map<String, dynamic> json) =>
      _$NumberRequestStepFromJson(json);
}
