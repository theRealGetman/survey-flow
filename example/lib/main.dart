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
        initialSteps: [
          InformationStep(
            title: 'Information title',
            buttons: [
              const StepButton.next(),
              const StepButton.skip(
                style: StepButtonStyle.secondary,
              ),
            ],
          ),
          InformationStep(
            title: 'Information 2 title',
            buttons: [
              const StepButton.submit(),
            ],
          ),
        ],
        onSubmit: (results) async {
          print('>>> SUBMIT $results');
          await Future.delayed(Duration(seconds: 3));
          return false;
        },
        onFinish: () {
          print('>>> FINISHED');
        },
      ),
    );
  }
}
