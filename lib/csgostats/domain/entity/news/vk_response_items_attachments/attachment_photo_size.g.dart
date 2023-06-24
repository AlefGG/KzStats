// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment_photo_size.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttachmentsPhotoSize _$AttachmentsPhotoSizeFromJson(
        Map<String, dynamic> json) =>
    AttachmentsPhotoSize(
      json['height'] as int,
      json['type'] as String,
      json['width'] as int,
      json['url'] as String,
    );

Map<String, dynamic> _$AttachmentsPhotoSizeToJson(
        AttachmentsPhotoSize instance) =>
    <String, dynamic>{
      'height': instance.height,
      'type': instance.type,
      'width': instance.width,
      'url': instance.url,
    };
