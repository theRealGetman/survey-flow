import 'package:flutter/material.dart';
import 'package:survey_flow/survey_flow.dart';

class StepContainer extends StatelessWidget {
  const StepContainer({
    Key? key,
    required this.step,
    required this.child,
  }) : super(key: key);

  final SurveyStep step;
  final Widget child;

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
                child: child,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
