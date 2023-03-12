import 'package:flutter/material.dart';
import 'package:survey_flow/survey_flow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SurveyFlow(
        backgroundImage: const StepImage.image(
          'https://e7.pngegg.com/pngimages/535/3/png-transparent-black-and-white-seamless-chevron-zigzag-pattern.png',
          source: StepImageSource.network,
          opacity: 0.1,
          position: ImagePosition.fill(),
        ),
        themeData: SurveyFlowThemeData(
          colors: SFColors(
            option: Colors.green.shade100.withOpacity(0.5),
            optionSelected: Colors.green.shade300,
          ),
        ),
        initialSteps: const [
          Mocks.informationStep,
          Mocks.informationStepWithImage,
          Mocks.singleSelect,
          Mocks.multiSelect,
          Mocks.numberRequestStep,
          Mocks.textRequestStep,
          Mocks.timeRequestStep,
          Mocks.dateRequestStep,
          Mocks.dateAndTimeRequestStep,
        ],
        onSubmit: (results) async {
          print('>>> SUBMIT $results');
          await Future.delayed(const Duration(seconds: 3));
          // return [];
          return [
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
    buttons: [
      StepButton.next(),
      StepButton.skip(),
    ],
  );

  static const InformationStep informationStepWithImage = InformationStep(
    title: 'Information title',
    description: 'Bla bla bla description for this step',
    image: StepImage.image(
      'https://icon-library.com/images/completed-icon/completed-icon-28.jpg',
      source: StepImageSource.network,
    ),
    buttons: [
      StepButton.next(),
      StepButton.skip(),
    ],
  );

  static const InformationStep informationStepWithLottie = InformationStep(
    title: 'Information title',
    description: 'Bla bla bla description for this step',
    image: StepImage.lottie(
      'assets/lottie/task-completed.json',
      source: StepImageSource.local,
    ),
    buttons: [
      StepButton.next(),
      StepButton.skip(),
    ],
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
      // SelectOption(
      //   text: 'Option 5',
      //   value: 'option_5',
      // ),
      // SelectOption(
      //   text: 'Option 6',
      //   description: 'Option description',
      //   value: 'option_6',
      // ),
      // SelectOption(
      //   text: 'Option 7',
      //   value: 'option_7',
      // ),
      // SelectOption(
      //   text: 'Option 8',
      //   value: 'option_8',
      // ),
    ],
  );

  static const MultiSelectStep multiSelect = MultiSelectStep(
    title: 'Select one option to move forward',
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
      // SelectOption(
      //   text: 'Option 5',
      //   value: 'option_5',
      // ),
      // SelectOption(
      //   text: 'Option 6',
      //   value: 'option_6',
      // ),
      // SelectOption(
      //   text: 'Option 7',
      //   value: 'option_7',
      // ),
    ],
  );

  static const NumberRequestStep numberRequestStep = NumberRequestStep(
    title: 'Number request title',
    description: 'Bla bla bla description for this step',
    hint: 'Your age',
    buttons: [
      StepButton.next(),
      StepButton.skip(),
    ],
  );

  static const TextRequestStep textRequestStep = TextRequestStep(
    title: 'Text request title',
    description: 'Bla bla bla description for this step',
    hint: 'Your name',
    buttons: [
      StepButton.next(),
      StepButton.skip(),
    ],
  );

  static const DateRequestStep dateRequestStep = DateRequestStep(
    title: 'Date request title',
    description: 'Bla bla bla description for this step',
    hint: 'Your date of birth',
    buttons: [
      StepButton.next(),
    ],
  );

  static const DateRequestStep timeRequestStep = DateRequestStep(
    title: 'Time request title',
    description: 'Bla bla bla description for this step',
    hint: 'Your time of birth',
    type: RequestType.time,
    buttons: [
      StepButton.next(),
    ],
  );

  static const DateRequestStep dateAndTimeRequestStep = DateRequestStep(
    title: 'Date and time request title',
    description: 'Bla bla bla description for this step',
    hint: 'Your date and time of birth',
    type: RequestType.dateAndTime,
    buttons: [
      StepButton.next(),
    ],
  );
}
