import 'package:json_annotation/json_annotation.dart';
import 'package:survey_flow/survey_flow.dart';

part 'select_option.g.dart';

@JsonSerializable()
class SelectOption extends StepButton {
  const SelectOption({
    required super.text,
    required this.value,
    super.id,
    this.description,
    super.action = StepActions.next,
    super.nextStepId,
  });

  final String? description;
  final dynamic value;

  @override
  Map<String, dynamic> toJson() => _$SelectOptionToJson(this);

  factory SelectOption.fromJson(Map<String, dynamic> json) =>
      _$SelectOptionFromJson(json);

  @override
  String toString() {
    return 'SelectOption{id: $id, value: $value}';
  }
}
