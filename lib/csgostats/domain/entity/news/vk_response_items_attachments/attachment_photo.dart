import 'package:csgostats/csgostats/domain/entity/news/vk_response_items_attachments/attachment_photo_size.dart';
import 'package:json_annotation/json_annotation.dart';
part 'attachment_photo.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class VkAttachmentsPhoto {
  final int? date;
  final int? albumId;
  final int id;
  final int ownerId;
  final String accessKey;
  final int postId;
  final List<AttachmentsPhotoSize> sizes;
  final String text;
  final int userId;
  final bool hasTags;

  VkAttachmentsPhoto(
      this.albumId,
      this.date,
      this.id,
      this.ownerId,
      this.accessKey,
      this.postId,
      this.sizes,
      this.text,
      this.userId,
      this.hasTags);
  factory VkAttachmentsPhoto.fromJson(Map<String, dynamic> json) =>
      _$VkAttachmentsPhotoFromJson(json);

  Map<String, dynamic> toJson() => _$VkAttachmentsPhotoToJson(this);
}
