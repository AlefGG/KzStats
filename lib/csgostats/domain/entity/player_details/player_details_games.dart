import 'package:csgostats/csgostats/domain/entity/player_details/player_details_games_name.dart';
import 'package:json_annotation/json_annotation.dart';

part 'player_details_games.g.dart';

@JsonSerializable(explicitToJson: true)
class PlayerDetailsGames {
  final PlayerDetailsGamesName? csgo;
  final PlayerDetailsGamesName? dota2;
  final PlayerDetailsGamesName? valorant;

  PlayerDetailsGames(
    this.csgo,
    this.dota2,
    this.valorant,
  );

  factory PlayerDetailsGames.fromJson(Map<String, dynamic> json) =>
      _$PlayerDetailsGamesFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerDetailsGamesToJson(this);
}
