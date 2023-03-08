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
        initialSteps: [
          InformationStep(
            title: 'Information title',
            description: 'Bla bla bla description for this step',
            image: const StepImage.svg(
              'https://www.svgrepo.com/show/24762/round-done-button.svg',
              source: StepImageSource.network,
              width: 0.3,
            ),
            buttons: [
              const StepButton.next(),
              const StepButton.skip(
                style: StepButtonStyle.secondary,
              ),
            ],
          ),
          InformationStep(
            title: 'Information 2 title',
            image: const StepImage.image(
              'https://icon-library.com/images/completed-icon/completed-icon-28.jpg',
              source: StepImageSource.network,
            ),
            buttons: [
              const StepButton.next(),
            ],
          ),
        ],
        onSubmit: (results) async {
          print('>>> SUBMIT $results');
          await Future.delayed(const Duration(seconds: 3));
          // return [];
          return [
            InformationStep(
              title: 'NEW INFORMATION STEP',
              image: const StepImage.lottie(
                'assets/lottie/task-completed.json',
                source: StepImageSource.local,
              ),
              buttons: [
                const StepButton.next(),
              ],
            ),
          ];
        },
        onFinish: () {
          print('>>> FINISHED');
        },
      ),
    );
  }
}
