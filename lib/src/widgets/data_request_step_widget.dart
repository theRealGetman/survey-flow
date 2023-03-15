import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:survey_flow/survey_flow.dart';

const String _dateFormat = 'd MMMM yyyy';
const String _timeFormat = 'HH:mm';
const String _dateTimeFormat = 'd MMMM yyyy HH:mm';

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
  DateTime? _selectedDate;

  bool isLoading = false;

  SurveyRequestStep get step => widget.step;

  @override
  Widget build(BuildContext context) {
    return StepContainer(
      step: step,
      child: Column(
        children: [
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: Text(
                  step.title,
                  textAlign: SurveyFlowTheme.of(context)
                      .theme
                      .textStyles
                      .titleTextAlign,
                  style: SurveyFlowTheme.of(context).theme.textStyles.title,
                ),
              ),
            ],
          ),
          if (step.description?.isNotEmpty == true)
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: SurveyFlowTheme.of(context)
                          .theme
                          .dimens
                          .descriptionToTitleMargin,
                    ),
                    child: Text(
                      step.description!,
                      textAlign: SurveyFlowTheme.of(context)
                          .theme
                          .textStyles
                          .descriptionTextAlign,
                      style: SurveyFlowTheme.of(context)
                          .theme
                          .textStyles
                          .description,
                    ),
                  ),
                ),
              ],
            ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: GestureDetector(
              onTap: !isLoading
                  ? () {
                      _showDatePicker(context);
                    }
                  : null,
              child: AbsorbPointer(
                absorbing: isDatePicker,
                child: TextField(
                  style: SurveyFlowTheme.of(context).theme.textStyles.textField,
                  enabled: !isLoading,
                  decoration: _decoration(context),
                  controller: _controller,
                  keyboardType: textInputType,
                  textAlign:
                      SurveyFlowTheme.of(context).theme.inputStyles.textAlign,
                  onTapOutside: (_) {
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
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

  InputDecoration _decoration(BuildContext context) {
    if (SurveyFlowTheme.of(context).theme.inputStyles.decorationBuilder !=
        null) {
      return SurveyFlowTheme.of(context).theme.inputStyles.decorationBuilder!(
        context,
        step,
      );
    }
    return SurveyFlowTheme.of(context).theme.inputStyles.decoration ??
        SFInputStyles.getDefaultInputDecoration(context, step);
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

  Future<void> _showDatePicker(BuildContext context) async {
    final DateFormat dateFormat = DateFormat(dateFormatPattern);
    DateTime? selected;

    final DateTime initialDate = _selectedDate ?? DateTime.now();
    setState(() {
      _selectedDate = initialDate;
      _controller.text = dateFormat.format(initialDate);
    });

    if (step.type == RequestType.date) {
      selected = await showPlatformDatePicker(
        context,
        initialDate: initialDate,
        onDateTimeChanged: (DateTime selectedDate) {
          setState(() {
            _selectedDate = DateUtils.dateOnly(selectedDate);
            _controller.text = dateFormat.format(selectedDate);
          });
        },
      );
      if (selected != null) {
        selected = DateUtils.dateOnly(selected);
      }
    } else if (step.type == RequestType.time) {
      final TimeOfDay? timeOfDay = await showPlatformTimePicker(
        context,
        initialDate: initialDate,
        onDateTimeChanged: (DateTime selectedDate) {
          setState(() {
            _selectedDate = selectedDate;
            _controller.text = dateFormat.format(selectedDate);
          });
        },
      );
      if (timeOfDay != null) {
        selected = DateTime(0, 0, 0, timeOfDay.hour, timeOfDay.minute);
      }
    } else if (step.type == RequestType.dateAndTime) {
      selected = await showPlatformDateAndTimePicker(
        context,
        initialDate: initialDate,
        onDateTimeChanged: (DateTime selectedDate) {
          setState(() {
            _selectedDate = selectedDate;
            _controller.text = dateFormat.format(selectedDate);
          });
        },
      );
    }
    if (selected != null) {
      setState(() {
        _selectedDate = selected;
        _controller.text = dateFormat.format(selected!);
      });
    }
  }

  String get dateFormatPattern {
    final DateRequestStep dateRequestStep = step as DateRequestStep;
    if (dateRequestStep.dateFormat?.isNotEmpty == true) {
      return dateRequestStep.dateFormat!;
    }
    switch (step.type) {
      case RequestType.date:
        return _dateFormat;
      case RequestType.time:
        return _timeFormat;
      case RequestType.dateAndTime:
        return _dateTimeFormat;
      default:
        throw UnsupportedError('Wrong step type for date picker');
    }
  }

  bool get isDatePicker =>
      step.type == RequestType.date ||
      step.type == RequestType.time ||
      step.type == RequestType.dateAndTime;

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
      case RequestType.date:
      case RequestType.time:
      case RequestType.dateAndTime:
        return _selectedDate?.toIso8601String();
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
      case RequestType.date:
      case RequestType.time:
      case RequestType.dateAndTime:
        return TextInputType.datetime;
    }
  }
}
