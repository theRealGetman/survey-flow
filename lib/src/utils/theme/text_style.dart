part of 'survey_flow_theme.dart';

class SFTextStyles {
  const SFTextStyles({
    this.title = const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 24.0,
      height: 30.0 / 24.0,
      color: Colors.black,
    ),
    this.titleTextAlign = TextAlign.center,
    this.description = const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16.0,
      height: 20.0 / 16.0,
      color: Colors.black,
    ),
    this.descriptionTextAlign = TextAlign.center,
    this.primaryButton = const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16.0,
      height: 1.0,
      color: Colors.white,
    ),
    this.secondaryButton = const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16.0,
      height: 1.0,
      color: Colors.black,
    ),
    this.option = const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16.0,
      height: 1.0,
      color: Colors.black,
    ),
    this.optionSelected = const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16.0,
      height: 1.0,
      color: Colors.white,
    ),
    this.optionDescription = const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12.0,
      height: 1.0,
      color: Colors.grey,
    ),
    this.optionSelectedDescription = const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12.0,
      height: 1.0,
      color: Colors.white,
    ),
    this.textField = const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16.0,
      height: 20.0 / 16.0,
      color: Colors.black,
    ),
  });

  final TextStyle title;
  final TextAlign titleTextAlign;
  final TextStyle description;
  final TextAlign descriptionTextAlign;
  final TextStyle primaryButton;
  final TextStyle secondaryButton;
  final TextStyle option;
  final TextStyle optionSelected;
  final TextStyle optionDescription;
  final TextStyle optionSelectedDescription;
  final TextStyle textField;
}
