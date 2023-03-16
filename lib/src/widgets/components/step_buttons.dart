import 'package:flutter/material.dart';
import 'package:survey_flow/survey_flow.dart';

class StepButtons extends StatelessWidget {
  const StepButtons({
    Key? key,
    required this.primaryButton,
    required this.onPressed,
    this.secondaryButton,
    this.stepValue,
  }) : super(key: key);

  final StepButton primaryButton;
  final StepButton? secondaryButton;
  final ButtonPressedCallback onPressed;
  final String? stepValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _button(context, primaryButton),
        if (secondaryButton != null) ...[
          const SizedBox(height: 8.0),
          _button(context, secondaryButton!),
        ],
      ],
    );
  }

  Widget _button(BuildContext context, StepButton button) {
    final bool fullWidth =
        SurveyFlowTheme.of(context).theme.buttonStyles.buttonWidth ==
            SFButtonWidth.full;
    if (fullWidth) {
      return StepButtonWidget(
        stepButton: button,
        onPressed: onPressed,
        stepValue: stepValue,
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StepButtonWidget(
            stepButton: button,
            onPressed: onPressed,
            stepValue: stepValue,
          ),
        ],
      );
    }
  }
}
