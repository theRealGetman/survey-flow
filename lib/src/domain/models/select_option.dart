class SelectOption<T> {
  SelectOption({
    required this.title,
    required this.value,
    this.id,
    this.description,
  });

  final String? id;
  final String title;
  final String? description;
  final T value;
}
