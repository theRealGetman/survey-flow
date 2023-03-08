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
                  vertical: SurveyFlowTheme.of(context).theme.verticalPadding,
                  horizontal:
                      SurveyFlowTheme.of(context).theme.horizontalPadding,
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
                    _buttons(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buttons(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: step.buttons.length,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StepButtonWidget(
              stepButton: step.buttons[index],
              onPressed: onPressed,
            ),
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 12.0);
      },
    );
  }
}
