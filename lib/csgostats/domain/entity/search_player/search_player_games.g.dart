// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_player_games.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchPlayerGames _$SearchPlayerGamesFromJson(Map<String, dynamic> json) =>
    SearchPlayerGames(
      json['name'] as String?,
      json['skill_level'] as String?,
    );

Map<String, dynamic> _$SearchPlayerGamesToJson(SearchPlayerGames instance) =>
    <String, dynamic>{
      'name': instance.gameName,
      'skill_level': instance.skillLevel,
    };
