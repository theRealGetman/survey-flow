import 'package:flutter/material.dart';
import 'package:survey_flow/survey_flow.dart';

class SelectionOptionWidget extends StatelessWidget {
  const SelectionOptionWidget({
    Key? key,
    required this.option,
    required this.onSelected,
    this.selected = false,
    this.loading = false,
  }) : super(key: key);

  final SelectOption option;
  final Function(SelectOption option) onSelected;
  final bool selected;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 16.0,
        ),
        backgroundColor: selected
            ? SurveyFlowTheme.of(context).theme.colors.optionSelected
            : SurveyFlowTheme.of(context).theme.colors.option,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            SurveyFlowTheme.of(context).theme.dimens.borderRadius,
          ),
        ),
      ),
      onPressed: loading
          ? null
          : () {
              onSelected(option);
            },
      child: loading && selected ? _loading(context) : _title(context),
    );
  }

  Widget _loading(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: _title(context),
        ),
        const SizedBox(width: 12.0),
        const StepProgressIndicator(),
      ],
    );
  }

  Widget _title(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          option.text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: selected
              ? SurveyFlowTheme.of(context).theme.textStyles.optionSelected
              : SurveyFlowTheme.of(context).theme.textStyles.option,
        ),
        if (option.description?.isNotEmpty == true)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              option.description!,
              style: selected
                  ? SurveyFlowTheme.of(context)
                      .theme
                      .textStyles
                      .optionSelectedDescription
                  : SurveyFlowTheme.of(context)
                      .theme
                      .textStyles
                      .optionDescription,
            ),
          ),
      ],
    );
  }
}
