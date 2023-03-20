import 'package:flutter/material.dart';
import 'package:survey_flow/survey_flow.dart';

class MultiSelectStepWidget extends StatefulWidget {
  const MultiSelectStepWidget({
    Key? key,
    required this.step,
    required this.onPressed,
  }) : super(key: key);

  final MultiSelectStep step;
  final ButtonPressedCallback onPressed;

  @override
  State<MultiSelectStepWidget> createState() => _MultiSelectStepWidgetState();
}

class _MultiSelectStepWidgetState extends State<MultiSelectStepWidget> {
  bool isLoading = false;
  final List<SelectOption> _selected = [];

  MultiSelectStep get step => widget.step;

  bool get minimumItemsSelected =>
      step.minimumAmountOfOptionsSelected == null ||
      _selected.length >= step.minimumAmountOfOptionsSelected!;

  bool get maximumItemsSelected =>
      step.maximumAmountOfOptionsSelected != null &&
      _selected.length == step.maximumAmountOfOptionsSelected!;

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
          const Spacer(),
          _options(context),
          SizedBox(
            height: SurveyFlowTheme.of(context).theme.dimens.optionItemsMargin,
          ),
          StepButtonWidget(
            stepButton: step.primaryButton,
            enabled: minimumItemsSelected,
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
    setState(() {
      isLoading = true;
    });

    await widget.onPressed(
      button,
      StepResult(
        stepId: step.id ?? 'not defined',
        value: _selected,
      ),
    );

    setState(() {
      isLoading = false;
    });
  }

  Widget _options(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: step.options.length,
      itemBuilder: (BuildContext context, int index) {
        return SelectionOptionWidget.multi(
          option: step.options[index],
          loading: isLoading,
          enabled: !maximumItemsSelected,
          selected: _selected.contains(step.options[index]),
          onSelected: (SelectOption option) async {
            setState(() {
              if (_selected.contains(option)) {
                _selected.remove(option);
              } else {
                _selected.add(option);
              }
            });
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: SurveyFlowTheme.of(context).theme.dimens.optionItemsMargin,
        );
      },
    );
  }
}
