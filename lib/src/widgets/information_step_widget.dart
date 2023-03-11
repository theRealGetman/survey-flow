import 'package:flutter/material.dart';
import 'package:survey_flow/survey_flow.dart';

class InformationStepWidget extends StatelessWidget {
  const InformationStepWidget({
    Key? key,
    required this.step,
    required this.onPressed,
  }) : super(key: key);

  final InformationStep step;
  final ButtonPressedCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return StepContainer(
      step: step,
      child: Column(
        children: [
          const Spacer(),
          Text(
            step.title,
            textAlign: TextAlign.center,
            style: SurveyFlowTheme.of(context).theme.textStyles.title,
          ),
          if (step.description?.isNotEmpty == true)
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Text(
                step.description!,
                textAlign: TextAlign.center,
                style: SurveyFlowTheme.of(context).theme.textStyles.description,
              ),
            ),
          if (step.image != null)
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: StepImageWidget(
                image: step.image!,
              ),
            ),
          const Spacer(),
          StepButtonsList(
            buttons: step.buttons,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
