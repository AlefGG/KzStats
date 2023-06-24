// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_details_games.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerDetailsGames _$PlayerDetailsGamesFromJson(Map<String, dynamic> json) =>
    PlayerDetailsGames(
      json['csgo'] == null
          ? null
          : PlayerDetailsGamesName.fromJson(
              json['csgo'] as Map<String, dynamic>),
      json['dota2'] == null
          ? null
          : PlayerDetailsGamesName.fromJson(
              json['dota2'] as Map<String, dynamic>),
      json['valorant'] == null
          ? null
          : PlayerDetailsGamesName.fromJson(
              json['valorant'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlayerDetailsGamesToJson(PlayerDetailsGames instance) =>
    <String, dynamic>{
      'csgo': instance.csgo?.toJson(),
      'dota2': instance.dota2?.toJson(),
      'valorant': instance.valorant?.toJson(),
    };
