import 'package:flutter/material.dart';
import 'package:survey_flow/survey_flow.dart';

class SecondaryButton extends StatefulWidget {
  const SecondaryButton({
    Key? key,
    required this.stepButton,
    required this.onPressed,
  }) : super(key: key);

  final StepButton stepButton;
  final ButtonPressedCallback onPressed;

  @override
  State<SecondaryButton> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {
  StepButton get stepButton => widget.stepButton;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isLoading
            ? null
            : () async {
                if (isLoading) {
                  return;
                }
                setState(() {
                  isLoading = true;
                });

                await widget.onPressed(stepButton);

                setState(() {
                  isLoading = false;
                });
              },
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 16.0,
          ),
          child: isLoading ? _loading(context) : _title(context),
        ),
      ),
    );
  }

  Widget _loading(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _title(context),
        const SizedBox(width: 12.0),
        const StepProgressIndicator(),
      ],
    );
  }

  Widget _title(BuildContext context) {
    return Text(
      stepButton.text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: SurveyFlowTheme.of(context).theme.textStyles.secondaryButton,
    );
  }
}
