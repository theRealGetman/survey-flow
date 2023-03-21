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
    final bool isModal = SurveyFlowTheme.of(context).theme.isModal;
    return Stack(
      children: [
        if (step.backgroundImage != null)
          BackgroundStepImage(image: step.backgroundImage!),
        if (isModal) _modal(context) else _fullScreen(context),
      ],
    );
  }

  Widget _fullScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical:
                  SurveyFlowTheme.of(context).theme.dimens.verticalPadding,
              horizontal:
                  SurveyFlowTheme.of(context).theme.dimens.horizontalPadding,
            ),
            child: child,
          ),
        ),
      ),
    );
  }

  Widget _modal(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: SurveyFlowTheme.of(context).theme.dimens.verticalPadding,
          horizontal:
              SurveyFlowTheme.of(context).theme.dimens.horizontalPadding,
        ),
        child: child,
      ),
    );
  }
}
