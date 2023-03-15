import 'package:flutter/material.dart';
import 'package:survey_flow/survey_flow.dart';

class SelectionOptionWidget extends StatelessWidget {
  const SelectionOptionWidget({
    Key? key,
    required this.option,
    required this.onSelected,
    this.selected = false,
    this.loading = false,
    this.multi = false,
    this.enabled = true,
  }) : super(key: key);

  const SelectionOptionWidget.multi({
    Key? key,
    required this.option,
    required this.onSelected,
    this.selected = false,
    this.loading = false,
    this.enabled = true,
  })  : multi = true,
        super(key: key);

  final SelectOption option;
  final Function(SelectOption option) onSelected;
  final bool selected;
  final bool loading;
  final bool multi;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: SurveyFlowTheme.of(context).theme.buttonStyles.selectOption ??
          SFButtonStyles.getSelectOptionDefault(context).copyWith(
            backgroundColor:
                MaterialStateProperty.all(_getBackgroundColor(context)),
          ),
      onPressed: (!enabled && !selected) || loading
          ? null
          : () {
              onSelected(option);
            },
      child:
          loading && selected && !multi ? _loading(context) : _title(context),
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
          style: _getTitleStyle(context),
        ),
        if (option.description?.isNotEmpty == true)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              option.description!,
              style: _getDescriptionStyle(context),
            ),
          ),
      ],
    );
  }

  Color _getSelectedColor(BuildContext context) {
    return SurveyFlowTheme.of(context).theme.colors.optionSelected ??
        Theme.of(context).primaryColor;
  }

  Color? _getBackgroundColor(BuildContext context) {
    if (!enabled && !selected) {
      return SurveyFlowTheme.of(context).theme.colors.option?.withOpacity(0.5);
    } else if (selected) {
      return _getSelectedColor(context);
    }
    return SurveyFlowTheme.of(context).theme.colors.option;
  }

  TextStyle _getTitleStyle(BuildContext context) {
    if (!enabled && !selected) {
      return SurveyFlowTheme.of(context).theme.textStyles.option.copyWith(
            color: SurveyFlowTheme.of(context)
                .theme
                .textStyles
                .option
                .color
                ?.withOpacity(0.5),
          );
    } else if (selected) {
      return SurveyFlowTheme.of(context).theme.textStyles.optionSelected;
    }
    return SurveyFlowTheme.of(context).theme.textStyles.option;
  }

  TextStyle _getDescriptionStyle(BuildContext context) {
    if (!enabled && !selected) {
      return SurveyFlowTheme.of(context)
          .theme
          .textStyles
          .optionDescription
          .copyWith(
            color: SurveyFlowTheme.of(context)
                .theme
                .textStyles
                .optionDescription
                .color
                ?.withOpacity(0.5),
          );
    } else if (selected) {
      return SurveyFlowTheme.of(context)
          .theme
          .textStyles
          .optionSelectedDescription;
    }
    return SurveyFlowTheme.of(context).theme.textStyles.optionDescription;
  }
}
