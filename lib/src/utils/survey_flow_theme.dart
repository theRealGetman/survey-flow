import 'package:flutter/material.dart';

class SurveyFlowThemeData {
  const SurveyFlowThemeData({
    this.colors = const SFColors(),
    this.horizontalPadding = 16.0,
    this.verticalPadding = 24.0,
    this.textStyles = const TextStyles(),
  });

  final double horizontalPadding;
  final double verticalPadding;
  final SFColors colors;
  final TextStyles textStyles;
}

class SFColors {
  const SFColors({
    this.background = Colors.white,
    this.button = Colors.green,
  });

  final Color background;
  final Color button;
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
  });

  final TextStyle title;
  final TextStyle description;
  final TextStyle primaryButton;
  final TextStyle secondaryButton;
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
