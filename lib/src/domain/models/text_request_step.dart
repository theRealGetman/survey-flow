import 'package:json_annotation/json_annotation.dart';
import 'package:survey_flow/survey_flow.dart';

part 'text_request_step.g.dart';

@JsonSerializable()
class TextRequestStep extends SurveyRequestStep {
  const TextRequestStep({
    required super.title,
    super.id,
    super.description,
    super.buttons = const [
      StepButton.next(),
    ],
    super.backgroundImage,
    super.type = RequestType.text,
    super.hint,
  });

  @override
  Map<String, dynamic> toJson() => _$TextRequestStepToJson(this);

  factory TextRequestStep.fromJson(Map<String, dynamic> json) =>
      _$TextRequestStepFromJson(json);
}
