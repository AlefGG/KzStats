import 'package:csgostats/csgostats/domain/entity/news/vk_response_items/vk_response_items_comments.dart';
import 'package:csgostats/csgostats/domain/entity/news/vk_response_items/vk_response_items_is_donut.dart';
import 'package:csgostats/csgostats/domain/entity/news/vk_response_items/vk_response_items_likes.dart';
import 'package:csgostats/csgostats/domain/entity/news/vk_response_items/vk_response_items_port_source.dart';
import 'package:csgostats/csgostats/domain/entity/news/vk_response_items/vk_response_items_reposts.dart';
import 'package:csgostats/csgostats/domain/entity/news/vk_response_items/vk_response_items_views.dart';
import 'package:csgostats/csgostats/domain/entity/news/vk_response_items_attachments/attachment.dart';
import 'package:json_annotation/json_annotation.dart';
part 'news_vk_response_items.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class VkResponseItems {
  final IsDonut donut;
  final int isPinned;
  final Comments comments;
  final int markedAsAds;
  final double shortTextRate;
  final String hash;
  final String type;
  final List<VkResponseItemsAttachments>? attachments;
  final int date;
  final int fromId;
  final int id;
  final Likes likes;
  final int ownerId;
  final PostSource postSource;
  final String postType;
  final Reposts reposts;
  final String text;
  final Views views;

  VkResponseItems(
    this.donut,
    this.isPinned,
    this.comments,
    this.markedAsAds,
    this.shortTextRate,
    this.hash,
    this.type,
    this.attachments,
    this.date,
    this.fromId,
    this.id,
    this.likes,
    this.ownerId,
    this.postSource,
    this.postType,
    this.reposts,
    this.text,
    this.views,
  );

  factory VkResponseItems.fromJson(Map<String, dynamic> json) =>
      _$VkResponseItemsFromJson(json);

  Map<String, dynamic> toJson() => _$VkResponseItemsToJson(this);
}
