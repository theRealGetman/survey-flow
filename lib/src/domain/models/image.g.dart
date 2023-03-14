// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StepImage _$StepImageFromJson(Map<String, dynamic> json) => StepImage(
      path: json['path'] as String,
      source: $enumDecodeNullable(_$StepImageSourceEnumMap, json['source'],
              unknownValue: StepImageSource.network) ??
          StepImageSource.network,
      type: $enumDecodeNullable(_$StepImageTypeEnumMap, json['type'],
              unknownValue: StepImageType.image) ??
          StepImageType.image,
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      position: json['position'] == null
          ? null
          : ImagePosition.fromJson(json['position'] as Map<String, dynamic>),
      opacity: (json['opacity'] as num?)?.toDouble() ?? 1.0,
    );

Map<String, dynamic> _$StepImageToJson(StepImage instance) => <String, dynamic>{
      'path': instance.path,
      'source': _$StepImageSourceEnumMap[instance.source]!,
      'type': _$StepImageTypeEnumMap[instance.type]!,
      'width': instance.width,
      'height': instance.height,
      'opacity': instance.opacity,
      'position': instance.position,
    };

const _$StepImageSourceEnumMap = {
  StepImageSource.local: 'local',
  StepImageSource.network: 'network',
};

const _$StepImageTypeEnumMap = {
  StepImageType.image: 'image',
  StepImageType.svg: 'svg',
  StepImageType.lottie: 'lottie',
};

ImagePosition _$ImagePositionFromJson(Map<String, dynamic> json) =>
    ImagePosition(
      left: (json['left'] as num?)?.toDouble(),
      top: (json['top'] as num?)?.toDouble(),
      right: (json['right'] as num?)?.toDouble(),
      bottom: (json['bottom'] as num?)?.toDouble(),
      fill: json['fill'] as bool? ?? false,
    );

Map<String, dynamic> _$ImagePositionToJson(ImagePosition instance) =>
    <String, dynamic>{
      'left': instance.left,
      'top': instance.top,
      'right': instance.right,
      'bottom': instance.bottom,
      'fill': instance.fill,
    };
