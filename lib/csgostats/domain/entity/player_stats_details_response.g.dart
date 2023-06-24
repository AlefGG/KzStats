// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_stats_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerStatsDetailsResponse _$PlayerStatsDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    PlayerStatsDetailsResponse(
      lifetimeStatistics: json['lifetime'] == null
          ? null
          : PlayerStatsDetails.fromJson(
              json['lifetime'] as Map<String, dynamic>),
      playerId: json['player_id'] as String?,
      gameId: json['game_id'] as String?,
      segments: (json['segments'] as List<dynamic>?)
          ?.map((e) =>
              PlayerStatsDetailsSegments.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlayerStatsDetailsResponseToJson(
        PlayerStatsDetailsResponse instance) =>
    <String, dynamic>{
      'lifetime': instance.lifetimeStatistics?.toJson(),
      'player_id': instance.playerId,
      'game_id': instance.gameId,
      'segments': instance.segments?.map((e) => e.toJson()).toList(),
    };
