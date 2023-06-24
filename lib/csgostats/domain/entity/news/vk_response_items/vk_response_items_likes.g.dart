// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vk_response_items_likes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Likes _$LikesFromJson(Map<String, dynamic> json) => Likes(
      json['can_like'] as int,
      json['count'] as int,
      json['user_likes'] as int,
      json['can_publish'] as int,
      json['repost_disabled'] as bool,
    );

Map<String, dynamic> _$LikesToJson(Likes instance) => <String, dynamic>{
      'can_like': instance.canLike,
      'count': instance.count,
      'user_likes': instance.userLikes,
      'can_publish': instance.canPublish,
      'repost_disabled': instance.repostDisabled,
    };
