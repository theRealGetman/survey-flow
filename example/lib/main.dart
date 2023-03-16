import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:survey_flow/survey_flow.dart';

part 'main.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // add converter for custom step
  stepsConverters.addAll({
    'customStep': (v) => CustomSurveyStep.fromJson(v),
  });

  // use SurveyStepConverter to parse steps
  final String initialStepsData =
      await rootBundle.loadString("assets/initial_steps.json");
  final List<dynamic> initialStepsDecoded = jsonDecode(initialStepsData);
  final String nextStepsData =
      await rootBundle.loadString("assets/next_steps.json");
  final List<dynamic> nextStepsDecoded = jsonDecode(nextStepsData);

  final List<SurveyStep> initialSteps = initialStepsDecoded
      .map((e) =>
          const SurveyStepConverter().fromJson(e as Map<String, dynamic>?))
      .toList();
  final List<SurveyStep> nextSteps = nextStepsDecoded
      .map((e) =>
          const SurveyStepConverter().fromJson(e as Map<String, dynamic>?))
      .toList();

  runApp(
    MyApp(
      initialSteps: initialSteps,
      nextSteps: nextSteps,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    this.initialSteps,
    this.nextSteps,
  });

  final List<SurveyStep>? initialSteps;
  final List<SurveyStep>? nextSteps;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SurveyFlow(
        backgroundImage: const StepImage.svg(
          'assets/badge.svg',
          source: StepImageSource.local,
          position: ImagePosition(right: 0.0, top: 0.0),
        ),
        themeData: customTheme,
        initialSteps: initialSteps ??
            const [
              Mocks.informationStep,
              Mocks.informationStepWithImage,
              Mocks.singleSelect,
              Mocks.multiSelect,
              Mocks.numberRequestStep,
              Mocks.textRequestStep,
              Mocks.timeRequestStep,
              Mocks.dateRequestStep,
              Mocks.dateAndTimeRequestStep,
              Mocks.customStep,
            ],
        actionHandler: {
          'action:notificationsPermission': ([StepResult? result]) async {
            print('REQUEST NOTIFICATION PERMISSION');
            await Future.delayed(Duration(seconds: 2));
            return StepActions.next;
          },
        },
        widgetHandler: (
          BuildContext context,
          SurveyStep step,
          ButtonPressedCallback onPressed,
        ) {
          if (step is CustomSurveyStep) {
            return CustomStepWidget(
              step: step,
              onPressed: onPressed,
            );
          }
          return null;
        },
        onSubmit: (results) async {
          print('>>> SUBMIT $results');
          await Future.delayed(const Duration(seconds: 3));
          return nextSteps ??
              [
                Mocks.informationStepWithLottie,
                // Mocks.multiSelect,
                // Mocks.dateRequestStep,
              ];
        },
        onFinish: () {
          print('>>> FINISHED');
        },
      ),
    );
  }

  SurveyFlowThemeData get customTheme {
    return SurveyFlowThemeData(
      dimens: const SFDimens(
        buttonBorderRadius: 8.0,
      ),
      colors: const SFColors(
        background: Color(0xff1e1f1f),
        button: Color(0xff009473),
        option: Colors.black26,
        optionSelected: Color(0xff009473),
        progressIndicatorColor: Colors.white,
      ),
      textStyles: SFTextStyles(
        titleTextAlign: TextAlign.start,
        title: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 24.0,
          height: 30.0 / 24.0,
          color: Colors.white,
        ),
        descriptionTextAlign: TextAlign.start,
        description: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16.0,
          height: 20.0 / 16.0,
          color: Colors.white.withOpacity(0.7),
        ),
        secondaryButton: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16.0,
          height: 1.0,
          color: Colors.white,
        ),
        option: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16.0,
          height: 1.0,
          color: Colors.white,
        ),
        optionDescription: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12.0,
          height: 1.0,
          color: Colors.white.withOpacity(0.7),
        ),
        textField: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16.0,
          height: 20.0 / 16.0,
          color: Colors.white,
        ),
      ),
      inputStyles: SFInputStyles(
        textAlign: TextAlign.center,
        decorationBuilder: (BuildContext context, SurveyRequestStep step) {
          return InputDecoration(
            labelText: step.hint,
            floatingLabelAlignment: FloatingLabelAlignment.center,
            labelStyle: SurveyFlowTheme.of(context)
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
            border: const UnderlineInputBorder(),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white70),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}

class Mocks {
  static const InformationStep informationStep = InformationStep(
    title: 'Information title',
    description: 'Bla bla bla description for this step',
    image: StepImage.svg(
      'https://www.svgrepo.com/show/24762/round-done-button.svg',
      source: StepImageSource.network,
      width: 0.3,
    ),
    primaryButton: StepButton(
      action: 'action:notificationsPermission',
      text: 'Next',
    ),
  );

  static const InformationStep informationStepWithImage = InformationStep(
    title: 'Information title',
    description: 'Bla bla bla description for this step',
    image: StepImage.image(
      'https://icon-library.com/images/completed-icon/completed-icon-28.jpg',
      source: StepImageSource.network,
    ),
    primaryButton: StepButton.next(),
    secondaryButton: StepButton.skip(),
  );

  static const InformationStep informationStepWithLottie = InformationStep(
    title: 'Information title',
    description: 'Bla bla bla description for this step',
    image: StepImage.lottie(
      'assets/lottie/task-completed.json',
      source: StepImageSource.local,
    ),
    primaryButton: StepButton.next(),
    secondaryButton: StepButton.skip(),
  );

  static const SingleSelectStep singleSelect = SingleSelectStep(
    title: 'Select one option to move forward',
    description: 'Bla bla bla description for this step',
    options: [
      SelectOption(
        text: 'Option 1',
        description: 'Option description',
        value: 'option_1',
      ),
      SelectOption(
        text: 'Notification permission',
        value: 'option_2',
        action: 'action:notificationsPermission',
      ),
      SelectOption(
        text: 'Option 3',
        description:
            'Option long description that should take at least two rows',
        value: 'option_3',
      ),
      SelectOption(
        text: 'Option 4',
        value: 'option_4',
      ),
    ],
  );

  static const MultiSelectStep multiSelect = MultiSelectStep(
    title: 'Select from 1 to 2 options to move forward',
    description: 'Bla bla bla description for this step',
    minimumAmountOfOptionsSelected: 1,
    maximumAmountOfOptionsSelected: 2,
    options: [
      SelectOption(
        text: 'Option 1',
        description: 'Option description',
        value: 'option_1',
      ),
      SelectOption(
        text: 'Option 2',
        value: 'option_2',
      ),
      SelectOption(
        text: 'Option 3',
        description:
            'Option long description that should take at least two rows',
        value: 'option_3',
      ),
      SelectOption(
        text: 'Option 4',
        value: 'option_4',
      ),
    ],
  );

  static const NumberRequestStep numberRequestStep = NumberRequestStep(
    title: 'Number request title',
    description: 'Bla bla bla description for this step',
    hint: 'Your age',
    primaryButton: StepButton.next(
      predicate: ButtonPredicate.moreThan(18),
    ),
    secondaryButton: StepButton.skip(),
  );

  static const TextRequestStep textRequestStep = TextRequestStep(
    title: 'Text request title',
    description: 'Bla bla bla description for this step',
    hint: 'Your name',
    primaryButton: StepButton.next(),
    secondaryButton: StepButton.skip(),
  );

  static const DateRequestStep dateRequestStep = DateRequestStep(
    title: 'Date request title',
    description: 'Bla bla bla description for this step',
    hint: 'Your date of birth',
    primaryButton: StepButton.next(),
  );

  static const DateRequestStep timeRequestStep = DateRequestStep(
    title: 'Time request title',
    description: 'Bla bla bla description for this step',
    hint: 'Your time of birth',
    type: RequestType.time,
    primaryButton: StepButton.next(),
  );

  static const DateRequestStep dateAndTimeRequestStep = DateRequestStep(
    title: 'Date and time request title',
    description: 'Bla bla bla description for this step',
    hint: 'Your date and time of birth',
    type: RequestType.dateAndTime,
    primaryButton: StepButton.next(),
  );

  static const CustomSurveyStep customStep = CustomSurveyStep(
    id: 'customStepId',
    title: 'This is my custom step title',
    description: 'Description for this custom step',
    image: StepImage.svg(
      'https://www.svgrepo.com/show/24762/round-done-button.svg',
      source: StepImageSource.network,
      width: 0.3,
    ),
    primaryButton: StepButton.submit(text: 'Let`s start'),
  );
}

@JsonSerializable()
class CustomSurveyStep implements SurveyStep {
  const CustomSurveyStep({
    required this.id,
    required this.title,
    required this.description,
    required this.primaryButton,
    required this.image,
    this.backgroundImage,
  });

  @override
  final String id;

  @override
  final String title;

  @override
  final String description;

  @override
  final StepImage? backgroundImage;

  final StepImage image;
  final StepButton primaryButton;

  Map<String, dynamic> toJson() => _$CustomSurveyStepToJson(this);

  factory CustomSurveyStep.fromJson(Map<String, dynamic> json) =>
      _$CustomSurveyStepFromJson(json);
}

class CustomStepWidget extends StatelessWidget {
  const CustomStepWidget({
    Key? key,
    required this.step,
    required this.onPressed,
  }) : super(key: key);

  final CustomSurveyStep step;
  final ButtonPressedCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return StepContainer(
      step: step,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          StepImageWidget(
            image: step.image,
          ),
          const SizedBox(height: 24.0),
          Text(
            step.title,
            textAlign: TextAlign.start,
            style: SurveyFlowTheme.of(context).theme.textStyles.title,
          ),
          const SizedBox(height: 24.0),
          Text(
            step.description,
            textAlign: TextAlign.start,
            style: SurveyFlowTheme.of(context).theme.textStyles.description,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              PrimaryButton(
                stepButton: const StepButton.next(),
                onPressed: onPressed,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
