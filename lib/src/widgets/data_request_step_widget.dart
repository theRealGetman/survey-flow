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
            child: GestureDetector(
              onTap: !isLoading
                  ? () {
                      _showDatePicker(context);
                    }
                  : null,
              child: AbsorbPointer(
                absorbing: isDatePicker,
                child: TextField(
                  style:
                      SurveyFlowTheme.of(context).theme.textStyles.description,
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
