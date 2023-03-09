import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:survey_flow/survey_flow.dart';

class StepProgressIndicator extends StatelessWidget {
  const StepProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double progressSize =
        SurveyFlowTheme.of(context).theme.textStyles.primaryButton.fontSize ??
            16.0;
    if (kIsWeb) {
      return SizedBox(
        width: progressSize,
        height: progressSize,
        child: const CircularProgressIndicator(strokeWidth: 2.0),
      );
    }
    return SizedBox(
      width: progressSize,
      height: progressSize,
      child: Platform.isIOS || Platform.isMacOS
          ? CupertinoActivityIndicator(
              radius: progressSize / 2,
            )
          : const CircularProgressIndicator(strokeWidth: 2.0),
    );
  }
}
