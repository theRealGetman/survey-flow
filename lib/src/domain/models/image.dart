class StepImage {
  const StepImage({
    required this.path,
    required this.source,
    required this.type,
    this.width,
    this.height,
    this.position,
    this.opacity = 1.0,
  });

  const StepImage.svg(
    this.path, {
    required this.source,
    this.width,
    this.height,
    this.position,
    this.opacity = 1.0,
  }) : type = StepImageType.svg;

  const StepImage.image(
    this.path, {
    required this.source,
    this.width,
    this.height,
    this.position,
    this.opacity = 1.0,
  }) : type = StepImageType.image;

  const StepImage.lottie(
    this.path, {
    required this.source,
    this.width,
    this.height,
    this.position,
    this.opacity = 1.0,
  }) : type = StepImageType.lottie;

  final String path;
  final StepImageSource source;
  final StepImageType type;

  // if less than 1 will use that value as fraction of screen width
  final double? width;
  final double? height;
  final double opacity;
  final ImagePosition? position;
}

enum StepImageSource {
  local,
  network,
}

enum StepImageType {
  image,
  svg,
  lottie,
}

class ImagePosition {
  const ImagePosition({
    this.left,
    this.top,
    this.right,
    this.bottom,
    this.fill = false,
  });

  const ImagePosition.fill({
    this.left,
    this.top,
    this.right,
    this.bottom,
  }) : fill = true;

  final double? left;
  final double? top;
  final double? right;
  final double? bottom;
  final bool fill;
}
