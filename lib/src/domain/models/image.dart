import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
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

  const StepImage.svg(this.path, {
    required this.source,
    this.width,
    this.height,
    this.position,
    this.opacity = 1.0,
  }) : type = StepImageType.svg;

  const StepImage.image(this.path, {
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
  @JsonKey(
    defaultValue: StepImageSource.network,
    unknownEnumValue: StepImageSource.network,
  )
  final StepImageSource source;
  @JsonKey(
    defaultValue: StepImageType.image,
    unknownEnumValue: StepImageType.image,
  )
  final StepImageType type;

  // if less than 1 will use that value as fraction of screen width
  final double? width;
  final double? height;
  final double opacity;
  final ImagePosition? position;

  Map<String, dynamic> toJson() => _$StepImageToJson(this);

  factory StepImage.fromJson(Map<String, dynamic> json) =>
      _$StepImageFromJson(json);
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

@JsonSerializable()
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

  Map<String, dynamic> toJson() => _$ImagePositionToJson(this);

  factory ImagePosition.fromJson(Map<String, dynamic> json) =>
      _$ImagePositionFromJson(json);
}
