import 'package:flutter/material.dart';
import 'package:survey_flow/survey_flow.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    Key? key,
    required this.stepButton,
    required this.onPressed,
    this.enabled = true,
    this.stepValue,
  }) : super(key: key);

  final StepButton stepButton;
  final ButtonPressedCallback onPressed;
  final bool enabled;
  final String? stepValue;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  StepButton get stepButton => widget.stepButton;

  bool isLoading = false;

  bool get notEnabled {
    if (!widget.enabled || isLoading) {
      return true;
    } else if (stepButton.predicate != null) {
      return !stepButton.predicate!.matches(widget.stepValue);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: SurveyFlowTheme.of(context).theme.buttonStyles.primary ??
          SFButtonStyles.getPrimaryDefault(context),
      onPressed: notEnabled
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
      child: isLoading ? _loading(context) : _title(context),
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
    );
  }
}
