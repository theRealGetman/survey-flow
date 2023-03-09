import 'package:survey_flow/survey_flow.dart';

class SelectOption<T> extends StepButton {
  const SelectOption({
    required super.text,
    required this.value,
    super.id,
    this.description,
    super.action = StepActions.next,
  });

  final String? description;
  final T value;
}
