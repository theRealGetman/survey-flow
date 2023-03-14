import 'package:json_annotation/json_annotation.dart';

part 'step_result.g.dart';

@JsonSerializable()
class StepResult {
  const StepResult({
    required this.stepId,
    required this.value,
  });

  final String stepId;
  final dynamic value;

  Map<String, dynamic> toJson() => _$StepResultToJson(this);

  factory StepResult.fromJson(Map<String, dynamic> json) =>
      _$StepResultFromJson(json);

  @override
  String toString() {
    return 'StepResult{stepId: $stepId, value: $value}';
  }
}
