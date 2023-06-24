import 'package:csgostats/csgostats/domain/entity/player_details/player_details_games.dart';
import 'package:csgostats/csgostats/domain/entity/player_details/player_details_infractions.dart';
import 'package:csgostats/csgostats/domain/entity/player_details/player_details_platforms.dart';
import 'package:csgostats/csgostats/domain/entity/player_details/player_details_settings.dart';
import 'package:json_annotation/json_annotation.dart';

part 'player_details_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class PlayerDetailsResponse {
  final String? playerId;
  final String? nickname;
  final String? avatar;
  final String? country;
  final String? coverImage;
  final PlayerDetailsPlatforms? platforms;
  final PlayerDetailsGames? games;
  final PlayerDetailsSettings? settings;
  final List<String>? friendIds;
  final String? newSteamId;
  @JsonKey(name: 'steam_id_64')
  final String? steamId64;
  final String? steamNickname;
  final List<String>? membership;
  final String? faceitUrl;
  final String? membershipType;
  final String? coverFeaturedImage;
  final PlayerDetailsInfractions? infractions;

  PlayerDetailsResponse({
    required this.playerId,
    required this.nickname,
    required this.avatar,
    required this.country,
    this.coverImage,
    required this.platforms,
    required this.games,
    required this.settings,
    this.friendIds,
    required this.newSteamId,
    required this.steamId64,
    required this.steamNickname,
    required this.membership,
    required this.faceitUrl,
    this.membershipType,
    this.coverFeaturedImage,
    this.infractions,
  });

  factory PlayerDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$PlayerDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerDetailsResponseToJson(this);
}
