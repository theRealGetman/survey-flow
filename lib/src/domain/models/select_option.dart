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

  @override
  String toString() {
    return 'SelectOption{id: $id, value: $value}';
  }
}
