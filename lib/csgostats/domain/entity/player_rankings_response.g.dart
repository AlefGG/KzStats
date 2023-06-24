// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_rankings_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerRankingsResponse _$PlayerRankingsResponseFromJson(
        Map<String, dynamic> json) =>
    PlayerRankingsResponse(
      playerRankings: (json['items'] as List<dynamic>)
          .map((e) => PlayerRankings.fromJson(e as Map<String, dynamic>))
          .toList(),
      start: json['start'] as int,
      end: json['end'] as int,
    );

Map<String, dynamic> _$PlayerRankingsResponseToJson(
        PlayerRankingsResponse instance) =>
    <String, dynamic>{
      'items': instance.playerRankings.map((e) => e.toJson()).toList(),
      'start': instance.start,
      'end': instance.end,
    };
