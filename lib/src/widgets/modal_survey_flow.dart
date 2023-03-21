import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:survey_flow/survey_flow.dart';

Future<void> showModalSurveyFlow({
  required BuildContext context,
  required List<SurveyStep> initialSteps,
  required VoidCallback onFinish,
  Future<List<SurveyStep>> Function(List<StepResult> results)? onSubmit,
  Map<String, CustomActionCallback>? actionHandler,
  CustomWidgetBuilder? widgetHandler,
  SurveyFlowThemeData themeData = const SurveyFlowThemeData(isModal: true),
}) {
  if (initialSteps.isEmpty) {
    return Future.value();
  }
  return Navigator.of(context, rootNavigator: true).push(
    PageRouteBuilder(
      opaque: false,
      pageBuilder: (_, __, ___) => _ModalSurveyFlow(
        initialSteps: initialSteps,
        onFinish: onFinish,
        onSubmit: onSubmit,
        themeData: themeData,
        actionHandler: actionHandler,
        widgetHandler: widgetHandler,
      ),
    ),
  );
}

class _ModalSurveyFlow extends StatefulWidget {
  const _ModalSurveyFlow({
    Key? key,
    required this.initialSteps,
    required this.onFinish,
    this.actionHandler,
    this.onSubmit,
    this.themeData = const SurveyFlowThemeData(),
    this.widgetHandler,
  }) : super(key: key);

  final List<SurveyStep> initialSteps;
  final Map<String, CustomActionCallback>? actionHandler;
  final CustomWidgetBuilder? widgetHandler;

  /// if onSubmit returns empty list - onFinish will be called right after onSubmit is finished
  /// else returned steps would be added to the queue
  final Future<List<SurveyStep>> Function(List<StepResult> results)? onSubmit;
  final VoidCallback onFinish;
  final SurveyFlowThemeData themeData;

  @override
  State<_ModalSurveyFlow> createState() => _ModalSurveyFlowState();
}

class _ModalSurveyFlowState extends State<_ModalSurveyFlow> {
  List<SurveyStep> steps = [];
  List<StepResult> results = [];
  int _currentStep = 0;

  @override
  void initState() {
    super.initState();

    steps.addAll(widget.initialSteps);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    SchedulerBinding.instance
        .addPostFrameCallback((_) => _show(context, steps.first));
  }

  Future<void> _show(BuildContext context, SurveyStep step) async {
    final result = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(widget.themeData.modalStyle.borderRadius),
        ),
      ),
      builder: (BuildContext context) {
        return SurveyFlowTheme(
          theme: widget.themeData,
          child: Builder(builder: (context) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(SurveyFlowTheme.of(context)
                      .theme
                      .modalStyle
                      .borderRadius),
                ),
              ),
              child: _mapStep(context, step),
            );
          }),
        );
      },
    );
    if (result == null) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
    );
  }

  Widget _mapStep(BuildContext context, SurveyStep step) {
    if (widget.widgetHandler != null) {
      final Widget? customWidget = widget.widgetHandler!(
        context,
        step,
        _handleOnPressed,
      );
      if (customWidget != null) {
        return customWidget;
      }
    }
    switch (step.runtimeType) {
      case InformationStep:
        return InformationStepWidget(
          step: step as InformationStep,
          onPressed: _handleOnPressed,
        );
      case SingleSelectStep:
        return SingleSelectStepWidget(
          step: step as SingleSelectStep,
          onSelected: _handleOnPressed,
        );
      case MultiSelectStep:
        return MultiSelectStepWidget(
          step: step as MultiSelectStep,
          onPressed: _handleOnPressed,
        );
      case NumberRequestStep:
      case TextRequestStep:
      case DateRequestStep:
      case SurveyRequestStep:
        return DataRequestStepWidget(
          step: step as SurveyRequestStep,
          onPressed: _handleOnPressed,
        );
      default:
        return UnknownStepWidget(
          step: step,
          onPressed: _handleOnPressed,
        );
    }
  }

  Future<void> _handleOnPressed(StepButton button, [StepResult? result]) async {
    String action = button.action;
    // handle custom actions
    if (widget.actionHandler?.containsKey(action) == true) {
      action = await widget.actionHandler![action]!(result);
    }
    if (result != null && action != StepActions.skip) {
      results.add(result);
    }
    if (action == StepActions.submit || _currentStep == steps.length - 1) {
      bool shouldFinish = true;
      // last page, so we need to submit
      if (widget.onSubmit != null) {
        final List<SurveyStep> newSteps = await widget.onSubmit!(results);
        shouldFinish = newSteps.isEmpty;
        setState(() {
          steps.addAll(newSteps);
        });
      }
      if (shouldFinish) {
        widget.onFinish();
        return;
      }
    }
    if (button.navigationConditions?.isNotEmpty == true) {
      final String? nextStepId =
          button.navigationConditions!.evaluate(result?.value);
      if (nextStepId?.isNotEmpty == true) {
        final int nextStepIndex =
            steps.indexWhere((SurveyStep step) => step.id == nextStepId);
        if (nextStepIndex > -1) {
          _currentStep = nextStepIndex;
          _openNextStep();
          return;
        }
      }
    }
    switch (action) {
      case StepActions.submit:
      case StepActions.next:
      case StepActions.skip:
        _currentStep++;
        _openNextStep();
        return;
    }
  }

  void _openNextStep() {
    Navigator.of(context).pop(true);
    _show(context, steps[_currentStep]);
  }
}
