// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_details_games_name.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerDetailsGamesName _$PlayerDetailsGamesNameFromJson(
        Map<String, dynamic> json) =>
    PlayerDetailsGamesName(
      json['faceit_elo'] as int?,
      json['game_player_id'] as String?,
      json['game_player_name'] as String,
      json['game_profile_id'] as String?,
      json['region'] as String?,
      json['skill_level'] as int?,
      json['skill_level_labe'] as String?,
    );

Map<String, dynamic> _$PlayerDetailsGamesNameToJson(
        PlayerDetailsGamesName instance) =>
    <String, dynamic>{
      'faceit_elo': instance.faceitElo,
      'game_player_id': instance.gamePlayerId,
      'game_player_name': instance.gamePlayerName,
      'game_profile_id': instance.gameProfileId,
      'region': instance.region,
      'skill_level': instance.skillLevel,
      'skill_level_labe': instance.skillLevelLabe,
    };
