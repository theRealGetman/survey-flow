import 'package:survey_flow/survey_flow.dart';

class DateRequestStep extends SurveyRequestStep {
  const DateRequestStep({
    required super.title,
    super.id,
    super.description,
    super.buttons = const [
      StepButton.next(),
    ],
    super.backgroundImage,
    super.type = RequestType.date,
    super.hint,
    this.dateFormat,
  });

  /// default 'd MMMM yyyy' for date, 'hh:mm' for time and 'd MMM yyyy hh:mm' for datetime
  final String? dateFormat;
}
