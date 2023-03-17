import 'package:flutter/material.dart';
import 'package:survey_flow/survey_flow.dart';

class SurveyFlow extends StatefulWidget {
  const SurveyFlow({
    Key? key,
    required this.initialSteps,
    required this.onFinish,
    this.loadingPlaceholder,
    this.errorPlaceholder,
    this.actionHandler,
    this.onSubmit,
    this.themeData = const SurveyFlowThemeData(),
    this.backgroundImage,
    this.widgetHandler,
  }) : super(key: key);

  final List<SurveyStep> initialSteps;
  final Widget? errorPlaceholder;
  final Widget? loadingPlaceholder;
  final Map<String, CustomActionCallback>? actionHandler;
  final CustomWidgetBuilder? widgetHandler;

  /// if onSubmit returns empty list - onFinish will be called right after onSubmit is finished
  /// else returned steps would be added to the queue
  final Future<List<SurveyStep>> Function(List<StepResult> results)? onSubmit;
  final VoidCallback onFinish;
  final SurveyFlowThemeData themeData;
  final StepImage? backgroundImage;

  @override
  State<SurveyFlow> createState() => _SurveyFlowState();
}

class _SurveyFlowState extends State<SurveyFlow> {
  final PageController _controller = PageController();
  List<SurveyStep> steps = [];
  List<StepResult> results = [];

  @override
  void initState() {
    super.initState();

    steps.addAll(widget.initialSteps);
  }

  @override
  Widget build(BuildContext context) {
    return SurveyFlowTheme(
      theme: widget.themeData,
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: SurveyFlowTheme.of(context).theme.colors.background,
          body: Stack(
            children: [
              if (widget.backgroundImage != null)
                BackgroundStepImage(image: widget.backgroundImage!),
              PageView.builder(
                controller: _controller,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: steps.length,
                itemBuilder: (BuildContext context, int index) {
                  return _mapStep(context, steps[index]);
                },
              ),
            ],
          ),
        );
      }),
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
    if (action == StepActions.submit ||
        _controller.page?.toInt() == steps.length - 1) {
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
          _controller.jumpToPage(nextStepIndex - 1);
          _controller.animateToPage(
            nextStepIndex,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
          return;
        }
      }
    }
    switch (action) {
      case StepActions.submit:
      case StepActions.next:
      case StepActions.skip:
        _controller.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
        return;
    }
  }
}
