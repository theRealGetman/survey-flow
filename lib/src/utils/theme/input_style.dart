part of 'survey_flow_theme.dart';

class SFInputStyles {
  const SFInputStyles({
    this.decorationBuilder,
    this.decoration,
    this.border = const OutlineInputBorder(),
    this.textAlign = TextAlign.center,
  });

  final InputDecorationBuilder? decorationBuilder;
  final InputDecoration? decoration;
  final InputBorder? border;
  final TextAlign textAlign;

  static InputDecoration getDefaultInputDecoration(
    BuildContext context,
    SurveyRequestStep step,
  ) =>
      InputDecoration(
        hintText: step.hint,
        hintStyle:
            SurveyFlowTheme.of(context).theme.textStyles.description.copyWith(
                  color: SurveyFlowTheme.of(context)
                      .theme
                      .textStyles
                      .description
                      .color
                      ?.withOpacity(0.5),
                ),
        contentPadding: EdgeInsets.symmetric(
          vertical:
              SurveyFlowTheme.of(context).theme.dimens.textFieldVerticalPadding,
          horizontal: SurveyFlowTheme.of(context)
              .theme
              .dimens
              .textFieldHorizontalPadding,
        ),
        border: SurveyFlowTheme.of(context).theme.inputStyles.border,
      );
}
