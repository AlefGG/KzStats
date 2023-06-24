// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_stats_details_segments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerStatsDetailsSegments _$PlayerStatsDetailsSegmentsFromJson(
        Map<String, dynamic> json) =>
    PlayerStatsDetailsSegments(
      json['type'] as String?,
      json['mode'] as String?,
      json['label'] as String?,
      json['img_small'] as String?,
      json['img_regular'] as String?,
      PlayerStatsDetailsMapStats.fromJson(
          json['stats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlayerStatsDetailsSegmentsToJson(
        PlayerStatsDetailsSegments instance) =>
    <String, dynamic>{
      'type': instance.type,
      'mode': instance.mode,
      'label': instance.label,
      'img_small': instance.imgSmall,
      'img_regular': instance.imgRegular,
      'stats': instance.stats.toJson(),
    };
