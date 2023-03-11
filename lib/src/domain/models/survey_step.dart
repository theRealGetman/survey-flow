import 'package:survey_flow/survey_flow.dart';

abstract class SurveyStep {
  String? get id;

  String get title;

  String? get description;

  StepImage? get backgroundImage;
}
