import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:survey_flow/survey_flow.dart';

final Map<String, SurveyStep Function(Map<String, dynamic>)> stepsConverters = {
  'information': (v) => InformationStep.fromJson(v),
  'request': (v) => SurveyRequestStep.fromJson(v),
  'dateRequest': (v) => DateRequestStep.fromJson(v),
  'numberRequest': (v) => NumberRequestStep.fromJson(v),
  'textRequest': (v) => TextRequestStep.fromJson(v),
  'singleSelect': (v) => SingleSelectStep.fromJson(v),
  'multiSelect': (v) => MultiSelectStep.fromJson(v),
};

class SurveyStepConverter
    implements JsonConverter<SurveyStep, Map<String, dynamic>?> {
  const SurveyStepConverter();

  @override
  SurveyStep fromJson(Map<String, dynamic>? json) {
    final String elementType = json!['stepType'];
    if (!stepsConverters.containsKey(elementType)) {
      if (kDebugMode) {
        print('Unknown step $json');
      }
      return UnknownStep.fromJson(json);
    } else {
      return stepsConverters[elementType]!(json);
    }
  }

  @override
  Map<String, dynamic>? toJson(SurveyStep item) {
    throw UnsupportedError('toJson is not supported for SurveyStep');
  }
}

class DynamicScreenNullableConverter
    implements JsonConverter<SurveyStep?, Map<String, dynamic>?> {
  const DynamicScreenNullableConverter();

  @override
  SurveyStep? fromJson(Map<String, dynamic>? json) {
    try {
      final String elementType = json!['elementType'];
      if (!stepsConverters.containsKey(elementType)) {
        if (kDebugMode) {
          print('Unknown step $json');
        }
        return UnknownStep.fromJson(json);
      } else {
        return stepsConverters[elementType]!(json);
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error while mapping $json >>> $e');
      }
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(SurveyStep? item) {
    throw UnsupportedError('toJson is not supported for SurveyStep');
  }
}
