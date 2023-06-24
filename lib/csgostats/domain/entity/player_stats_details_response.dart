import 'package:csgostats/csgostats/domain/entity/player_stats_details.dart';
import 'package:csgostats/csgostats/domain/entity/player_stats_details_segments.dart';
import 'package:json_annotation/json_annotation.dart';

part 'player_stats_details_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class PlayerStatsDetailsResponse {
  @JsonKey(name: 'lifetime')
  final PlayerStatsDetails? lifetimeStatistics;
  final String? playerId;
  final String? gameId;
  final List<PlayerStatsDetailsSegments>? segments;

  PlayerStatsDetailsResponse({
    required this.lifetimeStatistics,
    required this.playerId,
    required this.gameId,
    required this.segments,
  });

  factory PlayerStatsDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$PlayerStatsDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerStatsDetailsResponseToJson(this);
}
