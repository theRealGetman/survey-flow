import 'package:flutter/material.dart';
import 'package:survey_flow/survey_flow.dart';

class UnknownStepWidget extends StatelessWidget {
  const UnknownStepWidget({
    Key? key,
    required this.step,
    required this.onPressed,
  }) : super(key: key);

  final SurveyStep step;
  final ButtonPressedCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final bool isModal = SurveyFlowTheme.of(context).theme.isModal;
    return StepContainer(
      step: step,
      child: Column(
        mainAxisSize: isModal ? MainAxisSize.min : MainAxisSize.max,
        children: [
          if (!isModal) const Spacer(),
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
          if (isModal) const SizedBox(height: 24.0) else const Spacer(),
          StepButtonWidget(
            stepButton: const StepButton.skip(),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
