import 'package:flutter/material.dart';
import 'package:survey_flow/survey_flow.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    Key? key,
    required this.stepButton,
    required this.onPressed,
    this.enabled = true,
  }) : super(key: key);

  final StepButton stepButton;
  final ButtonPressedCallback onPressed;
  final bool enabled;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  StepButton get stepButton => widget.stepButton;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 16.0,
        ),
        backgroundColor: SurveyFlowTheme.of(context).theme.colors.button,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            SurveyFlowTheme.of(context).theme.dimens.borderRadius,
          ),
        ),
      ),
      onPressed: !widget.enabled || isLoading
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
      style: SurveyFlowTheme.of(context).theme.textStyles.primaryButton,
    );
  }
}
