// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_player_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchPlayerItems _$SearchPlayerItemsFromJson(Map<String, dynamic> json) =>
    SearchPlayerItems(
      json['player_id'] as String?,
      json['nickname'] as String?,
      json['status'] as String?,
      (json['games'] as List<dynamic>?)
          ?.map((e) => SearchPlayerGames.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['country'] as String?,
      json['verified'] as bool?,
      json['avatar'] as String?,
    );

Map<String, dynamic> _$SearchPlayerItemsToJson(SearchPlayerItems instance) =>
    <String, dynamic>{
      'player_id': instance.playerId,
      'nickname': instance.nickname,
      'status': instance.status,
      'games': instance.games?.map((e) => e.toJson()).toList(),
      'country': instance.country,
      'verified': instance.verified,
      'avatar': instance.avatar,
    };
