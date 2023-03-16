import 'package:json_annotation/json_annotation.dart';
import 'package:survey_flow/survey_flow.dart';

part 'date_request_step.g.dart';

@JsonSerializable()
class DateRequestStep extends SurveyRequestStep {
  const DateRequestStep({
    required super.title,
    super.id,
    super.description,
    super.primaryButton = const StepButton.next(),
    super.secondaryButton,
    super.backgroundImage,
    super.type = RequestType.date,
    super.hint,
    this.dateFormat,
  });

  /// default 'd MMMM yyyy' for date, 'hh:mm' for time and 'd MMM yyyy hh:mm' for datetime
  final String? dateFormat;

  @override
  Map<String, dynamic> toJson() => _$DateRequestStepToJson(this);

  factory DateRequestStep.fromJson(Map<String, dynamic> json) =>
      _$DateRequestStepFromJson(json);
}
