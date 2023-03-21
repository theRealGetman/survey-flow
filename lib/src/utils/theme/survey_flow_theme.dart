import 'package:flutter/material.dart';
import 'package:survey_flow/survey_flow.dart';

part 'button_style.dart';
part 'colors.dart';
part 'dimens.dart';
part 'input_style.dart';
part 'modal_style.dart';
part 'text_style.dart';

class SurveyFlowThemeData {
  const SurveyFlowThemeData({
    this.colors = const SFColors(),
    this.dimens = const SFDimens(),
    this.textStyles = const SFTextStyles(),
    this.buttonStyles = const SFButtonStyles(),
    this.inputStyles = const SFInputStyles(),
    this.modalStyle = const SFModalStyle(),
    this.isModal = false,
  });

  final SFDimens dimens;
  final SFColors colors;
  final SFTextStyles textStyles;
  final SFButtonStyles buttonStyles;
  final SFInputStyles inputStyles;
  final SFModalStyle modalStyle;
  final bool isModal;
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
