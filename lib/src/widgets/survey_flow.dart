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
  }) : super(key: key);

  final List<SurveyStep> initialSteps;
  final Widget? errorPlaceholder;
  final Widget? loadingPlaceholder;
  final Map<String, Function>? actionHandler;

  // if onSubmit returns true - onFinish will be called right after onSubmit is finished
  final Future<bool> Function(List<StepResult> results)? onSubmit;
  final VoidCallback onFinish;

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
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: steps.length,
        itemBuilder: (BuildContext context, int index) {
          return _mapStep(context, steps[index]);
        },
      ),
    );
  }

  Widget _mapStep(BuildContext context, SurveyStep step) {
    switch (step.runtimeType) {
      case InformationStep:
        return InformationStepWidget(
          step: step as InformationStep,
          onPressed: _handleOnPressed,
        );
      default:
        return const SizedBox();
    }
  }

  Future<void> _handleOnPressed(StepButton button, [StepResult? result]) async {
    if (result != null) {
      results.add(result);
    }
    if (_controller.page?.toInt() == steps.length - 1) {
      bool shouldFinish = true;
      // last page, so we need to submit
      if (widget.onSubmit != null) {
        shouldFinish = await widget.onSubmit!(results);
      }
      if (shouldFinish) {
        widget.onFinish();
        return;
      }
    }
    if (button.action == StepActions.next) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      return;
    }
  }
}
