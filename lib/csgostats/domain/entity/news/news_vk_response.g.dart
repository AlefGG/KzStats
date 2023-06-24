// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_vk_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VkResponse _$VkResponseFromJson(Map<String, dynamic> json) => VkResponse(
      json['count'] as int,
      (json['items'] as List<dynamic>)
          .map((e) => VkResponseItems.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VkResponseToJson(VkResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
