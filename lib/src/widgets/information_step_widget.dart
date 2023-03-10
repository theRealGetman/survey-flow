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
    return Stack(
      children: [
        if (step.backgroundImage != null)
          BackgroundStepImage(image: step.backgroundImage!),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical:
                      SurveyFlowTheme.of(context).theme.dimens.verticalPadding,
                  horizontal: SurveyFlowTheme.of(context)
                      .theme
                      .dimens
                      .horizontalPadding,
                ),
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
                          style: SurveyFlowTheme.of(context)
                              .theme
                              .textStyles
                              .description,
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
              ),
            ),
          ),
        ),
      ],
    );
  }
}
