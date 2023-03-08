import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:survey_flow/survey_flow.dart';

class StepImageWidget extends StatelessWidget {
  const StepImageWidget({
    Key? key,
    required this.image,
  }) : super(key: key);

  final StepImage image;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: image.opacity,
      child: _getImage(context),
    );
  }

  Widget _getImage(BuildContext context) {
    switch (image.type) {
      case StepImageType.image:
        return _image(context);
      case StepImageType.svg:
        return _svg(context);
      case StepImageType.lottie:
        return _lottie(context);
    }
  }

  double? _getWidth(BuildContext context) {
    if (image.width == null) {
      return null;
    }
    if (image.width! <= 1) {
      return MediaQuery.of(context).size.width * image.width!;
    }
    return image.width;
  }

  Widget _svg(BuildContext context) {
    switch (image.source) {
      case StepImageSource.local:
        return SvgPicture.asset(
          image.path,
          width: _getWidth(context),
          height: image.height,
          fit: BoxFit.fitWidth,
        );
      case StepImageSource.network:
        return SvgPicture.network(
          image.path,
          width: _getWidth(context),
          height: image.height,
          fit: BoxFit.fitWidth,
        );
    }
  }

  Widget _image(BuildContext context) {
    switch (image.source) {
      case StepImageSource.local:
        return Image.asset(
          image.path,
          width: _getWidth(context),
          height: image.height,
          fit: BoxFit.fitWidth,
        );
      case StepImageSource.network:
        return Image.network(
          image.path,
          width: _getWidth(context),
          height: image.height,
          fit: BoxFit.fitWidth,
        );
    }
  }

  Widget _lottie(BuildContext context) {
    switch (image.source) {
      case StepImageSource.local:
        return LottieBuilder.asset(
          image.path,
          width: _getWidth(context),
          height: image.height,
          fit: BoxFit.fitWidth,
        );
      case StepImageSource.network:
        return LottieBuilder.network(
          image.path,
          width: _getWidth(context),
          height: image.height,
          fit: BoxFit.fitWidth,
        );
    }
  }
}
