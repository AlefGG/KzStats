import 'package:csgostats/csgostats/domain/entity/player_stats_details_map_stats.dart';
import 'package:json_annotation/json_annotation.dart';

part 'player_stats_details_segments.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class PlayerStatsDetailsSegments {
  final String? type;
  final String? mode;
  final String? label;
  final String? imgSmall;
  final String? imgRegular;
  final PlayerStatsDetailsMapStats stats;

  PlayerStatsDetailsSegments(
    this.type,
    this.mode,
    this.label,
    this.imgSmall,
    this.imgRegular,
    this.stats,
  );

  factory PlayerStatsDetailsSegments.fromJson(Map<String, dynamic> json) =>
      _$PlayerStatsDetailsSegmentsFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerStatsDetailsSegmentsToJson(this);
}
