class StepResult<T> {
  final String stepId;
  final T value;

  StepResult({
    required this.stepId,
    required this.value,
  });

  @override
  String toString() {
    return 'StepResult{stepId: $stepId, value: $value}';
  }
}
