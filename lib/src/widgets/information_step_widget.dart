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
    return Center(
      child: Column(
        children: [
          Text(step.title),
          ElevatedButton(
            child: Text(step.buttons.first.text),
            onPressed: () {
              onPressed(step.buttons.first);
            },
          ),
        ],
      ),
    );
  }
}
