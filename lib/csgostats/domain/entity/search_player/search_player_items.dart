import 'package:csgostats/csgostats/domain/entity/search_player/search_player_games.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_player_items.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class SearchPlayerItems {
  final String? playerId;
  final String? nickname;
  final String? status;
  final List<SearchPlayerGames>? games;
  final String? country;
  final bool? verified;
  final String? avatar;

  SearchPlayerItems(
    this.playerId,
    this.nickname,
    this.status,
    this.games,
    this.country,
    this.verified,
    this.avatar,
  );
  factory SearchPlayerItems.fromJson(Map<String, dynamic> json) =>
      _$SearchPlayerItemsFromJson(json);

  Map<String, dynamic> toJson() => _$SearchPlayerItemsToJson(this);
}
