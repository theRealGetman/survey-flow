import 'package:json_annotation/json_annotation.dart';
import 'package:survey_flow/survey_flow.dart';

part 'survey_request_step.g.dart';

@JsonSerializable()
class SurveyRequestStep implements SurveyStep {
  const SurveyRequestStep({
    this.id,
    required this.title,
    required this.type,
    this.hint,
    this.description,
    this.buttons = const [
      StepButton.next(),
    ],
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

  final String? hint;
  @JsonKey(unknownEnumValue: RequestType.text)
  final RequestType type;
  final List<StepButton> buttons;

  Map<String, dynamic> toJson() => _$SurveyRequestStepToJson(this);

  factory SurveyRequestStep.fromJson(Map<String, dynamic> json) =>
      _$SurveyRequestStepFromJson(json);
}

enum RequestType {
  text,
  textMultiline,
  name,
  email,
  numberInt,
  numberDouble,
  date,
  time,
  dateAndTime,
}
