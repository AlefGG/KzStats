// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_vk_response_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VkResponseItems _$VkResponseItemsFromJson(Map<String, dynamic> json) =>
    VkResponseItems(
      IsDonut.fromJson(json['donut'] as Map<String, dynamic>),
      json['is_pinned'] as int,
      Comments.fromJson(json['comments'] as Map<String, dynamic>),
      json['marked_as_ads'] as int,
      (json['short_text_rate'] as num).toDouble(),
      json['hash'] as String,
      json['type'] as String,
      (json['attachments'] as List<dynamic>?)
          ?.map((e) =>
              VkResponseItemsAttachments.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['date'] as int,
      json['from_id'] as int,
      json['id'] as int,
      Likes.fromJson(json['likes'] as Map<String, dynamic>),
      json['owner_id'] as int,
      PostSource.fromJson(json['post_source'] as Map<String, dynamic>),
      json['post_type'] as String,
      Reposts.fromJson(json['reposts'] as Map<String, dynamic>),
      json['text'] as String,
      Views.fromJson(json['views'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VkResponseItemsToJson(VkResponseItems instance) =>
    <String, dynamic>{
      'donut': instance.donut.toJson(),
      'is_pinned': instance.isPinned,
      'comments': instance.comments.toJson(),
      'marked_as_ads': instance.markedAsAds,
      'short_text_rate': instance.shortTextRate,
      'hash': instance.hash,
      'type': instance.type,
      'attachments': instance.attachments?.map((e) => e.toJson()).toList(),
      'date': instance.date,
      'from_id': instance.fromId,
      'id': instance.id,
      'likes': instance.likes.toJson(),
      'owner_id': instance.ownerId,
      'post_source': instance.postSource.toJson(),
      'post_type': instance.postType,
      'reposts': instance.reposts.toJson(),
      'text': instance.text,
      'views': instance.views.toJson(),
    };
