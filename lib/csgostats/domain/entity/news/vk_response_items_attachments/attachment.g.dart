// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VkResponseItemsAttachments _$VkResponseItemsAttachmentsFromJson(
        Map<String, dynamic> json) =>
    VkResponseItemsAttachments(
      json['type'] as String,
      json['photo'] == null
          ? null
          : VkAttachmentsPhoto.fromJson(json['photo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VkResponseItemsAttachmentsToJson(
        VkResponseItemsAttachments instance) =>
    <String, dynamic>{
      'type': instance.type,
      'photo': instance.photo?.toJson(),
    };
