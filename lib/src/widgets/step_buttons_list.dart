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
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: buttons.length,
      itemBuilder: (BuildContext context, int index) {
        return Row(
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
        return const SizedBox(height: 12.0);
      },
    );
  }
}
