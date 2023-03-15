import 'package:flutter/material.dart';
import 'package:survey_flow/survey_flow.dart';

class StepButtonWidget extends StatelessWidget {
  const StepButtonWidget({
    Key? key,
    required this.stepButton,
    required this.onPressed,
  }) : super(key: key);

  final StepButton stepButton;
  final ButtonPressedCallback onPressed;

  @override
  Widget build(BuildContext context) {
    switch (stepButton.style) {
      case StepButtonStyle.primary:
        return PrimaryButton(
          stepButton: stepButton,
          onPressed: onPressed,
        );
      case StepButtonStyle.secondary:
        return SecondaryButton(
          stepButton: stepButton,
          onPressed: onPressed,
        );
    }
  }
}
