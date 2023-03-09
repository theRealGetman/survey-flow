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
    return Stack(
      children: [
        if (step.backgroundImage != null)
          BackgroundStepImage(image: step.backgroundImage!),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical:
                      SurveyFlowTheme.of(context).theme.dimens.verticalPadding,
                  horizontal: SurveyFlowTheme.of(context)
                      .theme
                      .dimens
                      .horizontalPadding,
                ),
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
                          style: SurveyFlowTheme.of(context)
                              .theme
                              .textStyles
                              .description,
                        ),
                      ),
                    const Spacer(),
                    _options(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
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
        return const SizedBox(height: 12.0);
      },
    );
  }
}
