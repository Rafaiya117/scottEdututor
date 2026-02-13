class ClassCategory {
  final String id;
  final String name;
  final String svgPath;

  const ClassCategory({
    required this.id,
    required this.name,
    required this.svgPath,
  });

}

  //!------ Quiz Question model ------!
  class RadioOption<T> {
  final T value;
  final String label;

  RadioOption({required this.value, required this.label});
}