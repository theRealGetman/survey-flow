import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:survey_flow/src/domain/models/models.dart';
import 'package:survey_flow/src/utils/callbacks.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    Key? key,
    required this.stepButton,
    required this.onPressed,
  }) : super(key: key);

  final StepButton stepButton;
  final ButtonPressedCallback onPressed;

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
        foregroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            32.0,
          ),
        ),
      ),
      onPressed: isLoading
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
        _progressIndicator(context),
      ],
    );
  }

  Widget _title(BuildContext context) {
    return Text(
      stepButton.text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.labelLarge,
    );
  }

  Widget _progressIndicator(BuildContext context) {
    final double progressSize =
        Theme.of(context).textTheme.labelLarge?.fontSize ?? 16.0;
    return SizedBox(
      width: progressSize,
      height: progressSize,
      child: kIsWeb || !Platform.isIOS || !Platform.isMacOS
          ? const CircularProgressIndicator(strokeWidth: 2.0)
          : CupertinoActivityIndicator(
              radius: progressSize / 2,
            ),
    );
  }
}
