import 'package:flutter/material.dart';

class SurveyFlowThemeData {
  const SurveyFlowThemeData({
    this.colors = const SFColors(),
    this.dimens = const Dimens(),
    this.textStyles = const TextStyles(),
  });

  final Dimens dimens;
  final SFColors colors;
  final TextStyles textStyles;
}

class SFColors {
  const SFColors({
    this.background = Colors.white,
    this.button = Colors.green,
    this.option = Colors.transparent,
    this.optionSelected = Colors.green,
  });

  final Color background;
  final Color button;
  final Color option;
  final Color optionSelected;
}

class Dimens {
  const Dimens({
    this.horizontalPadding = 16.0,
    this.verticalPadding = 24.0,
    this.borderRadius = 8.0,
  });

  final double horizontalPadding;
  final double verticalPadding;
  final double borderRadius;
}

class TextStyles {
  const TextStyles({
    this.title = const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 24.0,
      height: 30.0 / 24.0,
      color: Colors.black,
    ),
    this.description = const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16.0,
      height: 20.0 / 16.0,
      color: Colors.black,
    ),
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
  });

  final TextStyle title;
  final TextStyle description;
  final TextStyle primaryButton;
  final TextStyle secondaryButton;
  final TextStyle option;
  final TextStyle optionSelected;
  final TextStyle optionDescription;
  final TextStyle optionSelectedDescription;
}

class SurveyFlowTheme extends InheritedWidget {
  const SurveyFlowTheme({
    super.key,
    required this.theme,
    required Widget child,
  }) : super(child: child);

  static SurveyFlowTheme of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SurveyFlowTheme>()!;
  }

  final SurveyFlowThemeData theme;

  @override
  bool updateShouldNotify(SurveyFlowTheme oldWidget) =>
      theme != oldWidget.theme;
}
