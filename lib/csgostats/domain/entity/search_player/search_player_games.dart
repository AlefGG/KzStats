import 'package:json_annotation/json_annotation.dart';

part 'search_player_games.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SearchPlayerGames {
  @JsonKey(name: 'name')
  final String? gameName;
  final String? skillLevel;

  SearchPlayerGames(
    this.gameName,
    this.skillLevel,
  );
  factory SearchPlayerGames.fromJson(Map<String, dynamic> json) =>
      _$SearchPlayerGamesFromJson(json);

  Map<String, dynamic> toJson() => _$SearchPlayerGamesToJson(this);
}
