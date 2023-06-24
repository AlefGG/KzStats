import 'package:csgostats/csgostats/domain/entity/player_rankings.dart';
import 'package:json_annotation/json_annotation.dart';

part 'player_rankings_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class PlayerRankingsResponse {
  @JsonKey(name: 'items')
  final List<PlayerRankings> playerRankings;
  final int start;
  final int end;

  PlayerRankingsResponse({
    required this.playerRankings,
    required this.start,
    required this.end,
  });

  factory PlayerRankingsResponse.fromJson(Map<String, dynamic> json) =>
      _$PlayerRankingsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerRankingsResponseToJson(this);
}
