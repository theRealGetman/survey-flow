import 'package:flutter/material.dart';
import 'package:survey_flow/survey_flow.dart';

class StepButtonWidget extends StatefulWidget {
  const StepButtonWidget({
    Key? key,
    required this.stepButton,
    required this.onPressed,
    this.enabled = true,
    this.stepValue,
  }) : super(key: key);

  final StepButton stepButton;
  final ButtonPressedCallback onPressed;
  final String? stepValue;
  final bool enabled;

  @override
  State<StepButtonWidget> createState() => _StepButtonWidgetState();
}

class _StepButtonWidgetState extends State<StepButtonWidget> {
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
    switch (stepButton.style) {
      case StepButtonStyle.elevated:
        return _elevated(context);
      case StepButtonStyle.outlined:
        return _outlined(context);
      case StepButtonStyle.text:
        return _text(context);
    }
  }

  Widget _elevated(BuildContext context) {
    return ElevatedButton(
      style: getStyle(context),
      onPressed: notEnabled ? null : _onPressed,
      child: isLoading ? _loading(context) : _title(context),
    );
  }

  Widget _outlined(BuildContext context) {
    return OutlinedButton(
      style: getStyle(context),
      onPressed: notEnabled ? null : _onPressed,
      child: isLoading ? _loading(context) : _title(context),
    );
  }

  Widget _text(BuildContext context) {
    return TextButton(
      style: getStyle(context),
      onPressed: notEnabled ? null : _onPressed,
      child: isLoading ? _loading(context) : _title(context),
    );
  }

  ButtonStyle getStyle(BuildContext context) {
    switch (stepButton.type) {
      case StepButtonType.primary:
        return SurveyFlowTheme.of(context).theme.buttonStyles.primary ??
            SFButtonStyles.getPrimaryDefault(context);
      case StepButtonType.secondary:
        return SurveyFlowTheme.of(context).theme.buttonStyles.secondary ??
            SFButtonStyles.getSecondaryDefault(context);
    }
  }

  Future<void> _onPressed() async {
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
