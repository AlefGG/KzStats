// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerDetailsResponse _$PlayerDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    PlayerDetailsResponse(
      playerId: json['player_id'] as String?,
      nickname: json['nickname'] as String?,
      avatar: json['avatar'] as String?,
      country: json['country'] as String?,
      coverImage: json['cover_image'] as String?,
      platforms: json['platforms'] == null
          ? null
          : PlayerDetailsPlatforms.fromJson(
              json['platforms'] as Map<String, dynamic>),
      games: json['games'] == null
          ? null
          : PlayerDetailsGames.fromJson(json['games'] as Map<String, dynamic>),
      settings: json['settings'] == null
          ? null
          : PlayerDetailsSettings.fromJson(
              json['settings'] as Map<String, dynamic>),
      friendIds: (json['friend_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      newSteamId: json['new_steam_id'] as String?,
      steamId64: json['steam_id_64'] as String?,
      steamNickname: json['steam_nickname'] as String?,
      membership: (json['membership'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      faceitUrl: json['faceit_url'] as String?,
      membershipType: json['membership_type'] as String?,
      coverFeaturedImage: json['cover_featured_image'] as String?,
      infractions: json['infractions'] == null
          ? null
          : PlayerDetailsInfractions.fromJson(
              json['infractions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlayerDetailsResponseToJson(
        PlayerDetailsResponse instance) =>
    <String, dynamic>{
      'player_id': instance.playerId,
      'nickname': instance.nickname,
      'avatar': instance.avatar,
      'country': instance.country,
      'cover_image': instance.coverImage,
      'platforms': instance.platforms?.toJson(),
      'games': instance.games?.toJson(),
      'settings': instance.settings?.toJson(),
      'friend_ids': instance.friendIds,
      'new_steam_id': instance.newSteamId,
      'steam_id_64': instance.steamId64,
      'steam_nickname': instance.steamNickname,
      'membership': instance.membership,
      'faceit_url': instance.faceitUrl,
      'membership_type': instance.membershipType,
      'cover_featured_image': instance.coverFeaturedImage,
      'infractions': instance.infractions?.toJson(),
    };
