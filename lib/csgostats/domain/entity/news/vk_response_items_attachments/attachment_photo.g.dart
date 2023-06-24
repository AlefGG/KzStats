// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment_photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VkAttachmentsPhoto _$VkAttachmentsPhotoFromJson(Map<String, dynamic> json) =>
    VkAttachmentsPhoto(
      json['album_id'] as int?,
      json['date'] as int?,
      json['id'] as int,
      json['owner_id'] as int,
      json['access_key'] as String,
      json['post_id'] as int,
      (json['sizes'] as List<dynamic>)
          .map((e) => AttachmentsPhotoSize.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['text'] as String,
      json['user_id'] as int,
      json['has_tags'] as bool,
    );

Map<String, dynamic> _$VkAttachmentsPhotoToJson(VkAttachmentsPhoto instance) =>
    <String, dynamic>{
      'date': instance.date,
      'album_id': instance.albumId,
      'id': instance.id,
      'owner_id': instance.ownerId,
      'access_key': instance.accessKey,
      'post_id': instance.postId,
      'sizes': instance.sizes.map((e) => e.toJson()).toList(),
      'text': instance.text,
      'user_id': instance.userId,
      'has_tags': instance.hasTags,
    };
