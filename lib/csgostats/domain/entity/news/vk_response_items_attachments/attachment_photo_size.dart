import 'package:json_annotation/json_annotation.dart';

part 'attachment_photo_size.g.dart';

@JsonSerializable()
class AttachmentsPhotoSize {
  final int height;
  final String type;
  final int width;
  final String url;

  AttachmentsPhotoSize(this.height, this.type, this.width, this.url);

  factory AttachmentsPhotoSize.fromJson(Map<String, dynamic> json) =>
      _$AttachmentsPhotoSizeFromJson(json);

  Map<String, dynamic> toJson() => _$AttachmentsPhotoSizeToJson(this);
}
