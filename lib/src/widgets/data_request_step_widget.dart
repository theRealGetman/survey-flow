import 'package:flutter/material.dart';
import 'package:survey_flow/survey_flow.dart';

class DataRequestStepWidget extends StatefulWidget {
  const DataRequestStepWidget({
    Key? key,
    required this.step,
    required this.onPressed,
  }) : super(key: key);

  final SurveyRequestStep step;
  final ButtonPressedCallback onPressed;

  @override
  State<DataRequestStepWidget> createState() => _DataRequestStepWidgetState();
}

class _DataRequestStepWidgetState extends State<DataRequestStepWidget> {
  final TextEditingController _controller = TextEditingController();
  bool isLoading = false;

  SurveyRequestStep get step => widget.step;

  @override
  Widget build(BuildContext context) {
    return StepContainer(
      step: step,
      child: Column(
        children: [
          const Spacer(),
          Text(
            step.title,
            textAlign: TextAlign.center,
            style: SurveyFlowTheme.of(context).theme.textStyles.title,
          ),
          if (step.description?.isNotEmpty == true)
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Text(
                step.description!,
                textAlign: TextAlign.center,
                style: SurveyFlowTheme.of(context).theme.textStyles.description,
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: TextField(
              style: SurveyFlowTheme.of(context).theme.textStyles.description,
              enabled: !isLoading,
              decoration: InputDecoration(
                hintText: step.hint,
                hintStyle: SurveyFlowTheme.of(context)
                    .theme
                    .textStyles
                    .description
                    .copyWith(
                      color: SurveyFlowTheme.of(context)
                          .theme
                          .textStyles
                          .description
                          .color
                          ?.withOpacity(0.5),
                    ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: SurveyFlowTheme.of(context)
                      .theme
                      .dimens
                      .textFieldVerticalPadding,
                  horizontal: SurveyFlowTheme.of(context)
                      .theme
                      .dimens
                      .textFieldHorizontalPadding,
                ),
                border: const OutlineInputBorder(),
              ),
              controller: _controller,
              keyboardType: textInputType,
              textAlign: TextAlign.center,
              // autofocus: true,
              onTapOutside: (_) {
                FocusScope.of(context).unfocus();
              },
            ),
          ),
          const Spacer(),
          StepButtonsList(
            buttons: step.buttons,
            onPressed: _onPressed,
          ),
        ],
      ),
    );
  }

  Future<void> _onPressed(StepButton button, [StepResult? result]) async {
    if (isLoading) {
      return;
    }
    FocusScope.of(context).unfocus();

    setState(() {
      isLoading = true;
    });

    await widget.onPressed(
      button,
      StepResult(
        stepId: step.id ?? 'not defined',
        value: resultValue,
      ),
    );

    setState(() {
      isLoading = false;
    });
  }

  dynamic get resultValue {
    switch (step.type) {
      case RequestType.text:
      case RequestType.textMultiline:
      case RequestType.name:
      case RequestType.email:
        return _controller.text;
      case RequestType.numberInt:
        return int.tryParse(_controller.text);
      case RequestType.numberDouble:
        return double.tryParse(_controller.text);
    }
  }

  TextInputType get textInputType {
    switch (step.type) {
      case RequestType.text:
        return TextInputType.text;
      case RequestType.textMultiline:
        return TextInputType.multiline;
      case RequestType.numberInt:
        return TextInputType.number;
      case RequestType.numberDouble:
        return const TextInputType.numberWithOptions(
          decimal: true,
        );
      case RequestType.email:
        return TextInputType.emailAddress;
      case RequestType.name:
        return TextInputType.name;
    }
  }
}
