// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_rankings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerRankings _$PlayerRankingsFromJson(Map<String, dynamic> json) =>
    PlayerRankings(
      PlayerRankings._parseCountry(json['country'] as String?),
      json['faceit_elo'] as int,
      json['game_skill_level'] as int,
      PlayerRankings._parseNickname(json['nickname'] as String?),
      json['player_id'] as String,
      json['position'] as int,
    );

Map<String, dynamic> _$PlayerRankingsToJson(PlayerRankings instance) =>
    <String, dynamic>{
      'country': instance.country,
      'faceit_elo': instance.faceitElo,
      'game_skill_level': instance.gameSkillLevel,
      'nickname': instance.nickname,
      'player_id': instance.playerId,
      'position': instance.position,
    };
