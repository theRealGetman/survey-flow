import 'package:flutter/material.dart';
import 'package:survey_flow/survey_flow.dart';

class SingleSelectStepWidget extends StatefulWidget {
  const SingleSelectStepWidget({
    Key? key,
    required this.step,
    required this.onSelected,
  }) : super(key: key);

  final SingleSelectStep step;
  final ButtonPressedCallback onSelected;

  @override
  State<SingleSelectStepWidget> createState() => _SingleSelectStepWidgetState();
}

class _SingleSelectStepWidgetState extends State<SingleSelectStepWidget> {
  bool isLoading = false;
  SelectOption? _selected;

  SingleSelectStep get step => widget.step;

  @override
  Widget build(BuildContext context) {
    final bool isModal = SurveyFlowTheme.of(context).theme.isModal;
    return StepContainer(
      step: step,
      child: Column(
        mainAxisSize: isModal ? MainAxisSize.min : MainAxisSize.max,
        children: [
          if (!isModal) const Spacer(),
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
          if (isModal) const SizedBox(height: 24.0) else const Spacer(),
          _options(context),
        ],
      ),
    );
  }

  Widget _options(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: step.options.length,
      itemBuilder: (BuildContext context, int index) {
        return SelectionOptionWidget(
          option: step.options[index],
          loading: isLoading,
          selected: _selected == step.options[index],
          onSelected: (SelectOption option) async {
            if (isLoading) {
              return;
            }
            setState(() {
              isLoading = true;
              _selected = option;
            });

            await widget.onSelected(
              option,
              StepResult(
                stepId: step.id ?? 'not defined',
                value: option.value,
              ),
            );

            setState(() {
              isLoading = false;
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
