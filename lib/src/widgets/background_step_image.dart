import 'package:flutter/material.dart';
import 'package:survey_flow/survey_flow.dart';

class BackgroundStepImage extends StatelessWidget {
  const BackgroundStepImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final StepImage image;

  @override
  Widget build(BuildContext context) {
    if (image.position != null) {
      final ImagePosition position = image.position!;
      if (position.fill) {
        return Positioned.fill(
          left: position.left,
          right: position.right,
          top: position.top,
          bottom: position.bottom,
          child: StepImageWidget(
            image: image,
          ),
        );
      }
      return Positioned(
        left: position.left,
        right: position.right,
        top: position.top,
        bottom: position.bottom,
        child: StepImageWidget(
          image: image,
        ),
      );
    }
    return StepImageWidget(image: image);
  }
}
