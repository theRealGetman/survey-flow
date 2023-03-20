import 'package:flutter/material.dart';
import 'package:survey_flow/survey_flow.dart';

class StepButtons extends StatelessWidget {
  const StepButtons({
    Key? key,
    required this.primaryButton,
    required this.onPressed,
    this.secondaryButton,
    this.stepValue,
    this.buttonsAlignment = ButtonsAlignment.vertical,
  }) : super(key: key);

  final StepButton primaryButton;
  final StepButton? secondaryButton;
  final ButtonPressedCallback onPressed;
  final String? stepValue;
  final ButtonsAlignment buttonsAlignment;

  @override
  Widget build(BuildContext context) {
    switch (buttonsAlignment) {
      case ButtonsAlignment.vertical:
        return _vertical(context);
      case ButtonsAlignment.horizontal:
        return _horizontal(context);
    }
  }

  Widget _vertical(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buttonVertical(context, primaryButton),
        if (secondaryButton != null) ...[
          const SizedBox(height: 8.0),
          _buttonVertical(context, secondaryButton!),
        ],
      ],
    );
  }

  Widget _buttonVertical(BuildContext context, StepButton button) {
    final bool fullWidth =
        SurveyFlowTheme.of(context).theme.buttonStyles.buttonWidth ==
            SFButtonWidth.full;
    if (fullWidth) {
      return Row(
        children: [
          Expanded(
            child: StepButtonWidget(
              stepButton: button,
              onPressed: onPressed,
              stepValue: stepValue,
            ),
          ),
        ],
      );
    } else {
      return StepButtonWidget(
        stepButton: button,
        onPressed: onPressed,
        stepValue: stepValue,
      );
    }
  }

  Widget _horizontal(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (secondaryButton != null) ...[
          _buttonHorizontal(context, secondaryButton!),
          const SizedBox(width: 8.0),
        ],
        _buttonHorizontal(context, primaryButton),
      ],
    );
  }

  Widget _buttonHorizontal(BuildContext context, StepButton button) {
    final bool fullWidth =
        SurveyFlowTheme.of(context).theme.buttonStyles.buttonWidth ==
            SFButtonWidth.full;
    if (fullWidth) {
      return Expanded(
        child: StepButtonWidget(
          stepButton: button,
          onPressed: onPressed,
          stepValue: stepValue,
        ),
      );
    } else {
      return StepButtonWidget(
        stepButton: button,
        onPressed: onPressed,
        stepValue: stepValue,
      );
    }
  }
}
