// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vk_response_items_comments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comments _$CommentsFromJson(Map<String, dynamic> json) => Comments(
      json['can_post'] as int,
      json['count'] as int,
      json['groups_can_post'] as bool,
    );

Map<String, dynamic> _$CommentsToJson(Comments instance) => <String, dynamic>{
      'can_post': instance.canPost,
      'count': instance.Count,
      'groups_can_post': instance.groupsCanPost,
    };
