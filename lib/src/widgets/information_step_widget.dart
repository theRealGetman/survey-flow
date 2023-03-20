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
          Row(
            children: [
              Expanded(
                child: Text(
                  step.title,
                  textAlign: SurveyFlowTheme.of(context)
                      .theme
                      .textStyles
                      .titleTextAlign,
                  style: SurveyFlowTheme.of(context).theme.textStyles.title,
                ),
              ),
            ],
          ),
          if (step.description?.isNotEmpty == true)
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: SurveyFlowTheme.of(context)
                          .theme
                          .dimens
                          .descriptionToTitleMargin,
                    ),
                    child: Text(
                      step.description!,
                      textAlign: SurveyFlowTheme.of(context)
                          .theme
                          .textStyles
                          .descriptionTextAlign,
                      style: SurveyFlowTheme.of(context)
                          .theme
                          .textStyles
                          .description,
                    ),
                  ),
                ),
              ],
            ),
          if (step.image != null)
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: StepImageWidget(
                image: step.image!,
              ),
            ),
          const Spacer(),
          StepButtons(
            primaryButton: step.primaryButton,
            secondaryButton: step.secondaryButton,
            buttonsAlignment: step.buttonsAlignment,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
