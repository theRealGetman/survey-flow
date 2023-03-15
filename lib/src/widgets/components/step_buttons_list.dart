import 'package:flutter/material.dart';
import 'package:survey_flow/survey_flow.dart';

class StepButtonsList extends StatelessWidget {
  const StepButtonsList({
    Key? key,
    required this.buttons,
    required this.onPressed,
  }) : super(key: key);

  final List<StepButton> buttons;
  final ButtonPressedCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final bool fullWidth =
        SurveyFlowTheme.of(context).theme.buttonStyles.buttonWidth ==
            SFButtonWidth.full;

    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: buttons.length,
      itemBuilder: (BuildContext context, int index) {
        return fullWidth
            ? StepButtonWidget(
                stepButton: buttons[index],
                onPressed: onPressed,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StepButtonWidget(
                    stepButton: buttons[index],
                    onPressed: onPressed,
                  ),
                ],
              );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 8.0);
      },
    );
  }
}
