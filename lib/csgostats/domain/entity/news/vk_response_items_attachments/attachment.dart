import 'package:csgostats/csgostats/domain/entity/news/vk_response_items_attachments/attachment_photo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'attachment.g.dart';

@JsonSerializable(explicitToJson: true)
class VkResponseItemsAttachments {
  final String type;
  final VkAttachmentsPhoto? photo;

  VkResponseItemsAttachments(this.type, this.photo);
  factory VkResponseItemsAttachments.fromJson(Map<String, dynamic> json) =>
      _$VkResponseItemsAttachmentsFromJson(json);

  Map<String, dynamic> toJson() => _$VkResponseItemsAttachmentsToJson(this);
}
