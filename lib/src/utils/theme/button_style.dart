part of 'survey_flow_theme.dart';

class SFButtonStyles {
  const SFButtonStyles({
    this.primary,
    this.secondary,
    this.selectOption,
    this.buttonWidth = SFButtonWidth.full,
  });

  final ButtonStyle? primary;
  final ButtonStyle? secondary;
  final ButtonStyle? selectOption;
  final SFButtonWidth buttonWidth;

  static ButtonStyle getPrimaryDefault(BuildContext context) =>
      ElevatedButton.styleFrom(
        disabledForegroundColor: SurveyFlowTheme.of(context)
            .theme
            .textStyles
            .primaryButton
            .color
            ?.withOpacity(0.5),
        foregroundColor:
            SurveyFlowTheme.of(context).theme.textStyles.primaryButton.color,
        textStyle: SurveyFlowTheme.of(context).theme.textStyles.primaryButton,
        padding: EdgeInsets.symmetric(
          vertical:
              SurveyFlowTheme.of(context).theme.dimens.buttonVerticalPadding,
          horizontal:
              SurveyFlowTheme.of(context).theme.dimens.buttonHorizontalPadding,
        ),
        backgroundColor: SurveyFlowTheme.of(context).theme.colors.button,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            SurveyFlowTheme.of(context).theme.dimens.buttonBorderRadius,
          ),
        ),
      );

  static ButtonStyle getSecondaryDefault(BuildContext context) =>
      TextButton.styleFrom(
        disabledForegroundColor: SurveyFlowTheme.of(context)
            .theme
            .textStyles
            .secondaryButton
            .color
            ?.withOpacity(0.5),
        foregroundColor:
            SurveyFlowTheme.of(context).theme.textStyles.secondaryButton.color,
        textStyle: SurveyFlowTheme.of(context).theme.textStyles.secondaryButton,
        padding: EdgeInsets.symmetric(
          vertical:
              SurveyFlowTheme.of(context).theme.dimens.buttonVerticalPadding,
          horizontal:
              SurveyFlowTheme.of(context).theme.dimens.buttonHorizontalPadding,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            SurveyFlowTheme.of(context).theme.dimens.buttonBorderRadius,
          ),
        ),
      );

  static ButtonStyle getSelectOptionDefault(BuildContext context) =>
      OutlinedButton.styleFrom(
        disabledForegroundColor: SurveyFlowTheme.of(context)
            .theme
            .textStyles
            .option
            .color
            ?.withOpacity(0.5),
        foregroundColor:
            SurveyFlowTheme.of(context).theme.textStyles.option.color,
        textStyle: SurveyFlowTheme.of(context).theme.textStyles.option,
        padding: EdgeInsets.symmetric(
          vertical:
              SurveyFlowTheme.of(context).theme.dimens.buttonVerticalPadding,
          horizontal:
              SurveyFlowTheme.of(context).theme.dimens.buttonHorizontalPadding,
        ),
        backgroundColor: SurveyFlowTheme.of(context).theme.colors.option,
        disabledBackgroundColor:
            SurveyFlowTheme.of(context).theme.colors.option?.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            SurveyFlowTheme.of(context).theme.dimens.buttonBorderRadius,
          ),
        ),
      );
}

enum SFButtonWidth { full, wrap }
