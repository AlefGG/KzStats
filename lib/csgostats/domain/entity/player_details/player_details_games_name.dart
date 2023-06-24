import 'package:json_annotation/json_annotation.dart';

part 'player_details_games_name.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PlayerDetailsGamesName {
  final int? faceitElo;
  final String? gamePlayerId;
  final String gamePlayerName;
  final String? gameProfileId;
  final String? region;
  final int? skillLevel;
  final String? skillLevelLabe;

  PlayerDetailsGamesName(
    this.faceitElo,
    this.gamePlayerId,
    this.gamePlayerName,
    this.gameProfileId,
    this.region,
    this.skillLevel,
    this.skillLevelLabe,
  );

  factory PlayerDetailsGamesName.fromJson(Map<String, dynamic> json) =>
      _$PlayerDetailsGamesNameFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerDetailsGamesNameToJson(this);
}
