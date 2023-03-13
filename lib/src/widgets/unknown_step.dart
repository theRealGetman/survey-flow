import 'package:flutter/material.dart';
import 'package:survey_flow/survey_flow.dart';

class UnknownStep extends StatelessWidget {
  const UnknownStep({
    Key? key,
    required this.step,
    required this.onPressed,
  }) : super(key: key);

  final SurveyStep step;
  final ButtonPressedCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return StepContainer(
      step: step,
      child: Column(
        children: [
          const Spacer(),
          Text(
            'There is no predefined widget for ${step.runtimeType}',
            textAlign: TextAlign.center,
            style: SurveyFlowTheme.of(context).theme.textStyles.title,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text(
              'You can add custom widget handler by providing widgetHandler property to SurveyFlow',
              textAlign: TextAlign.center,
              style: SurveyFlowTheme.of(context).theme.textStyles.description,
            ),
          ),
          const Spacer(),
          PrimaryButton(
            stepButton: const StepButton.skip(),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
