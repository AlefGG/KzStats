import 'package:json_annotation/json_annotation.dart';

part 'player_stats_details_map_stats.g.dart';

@JsonSerializable()
class PlayerStatsDetailsMapStats {
  @JsonKey(name: 'Penta Kills')
  final String? pentaKills;
  @JsonKey(name: 'Deaths')
  final String? deaths;
  @JsonKey(name: 'Quadro Kills')
  final String? quadroKills;
  @JsonKey(name: 'Matches')
  final String? matches;
  @JsonKey(name: 'Triple Kills')
  final String? tripleKills;
  @JsonKey(name: 'Average Assists')
  final String? avgAssists;
  @JsonKey(name: 'Wins')
  final String? wins;
  @JsonKey(name: 'Win Rate %')
  final String? winratePercentage;
  @JsonKey(name: 'Headshots per Match')
  final String? hsPerMatch;
  @JsonKey(name: 'Total Headshots %')
  final String? totalHsPercent;
  @JsonKey(name: 'Average Penta Kills')
  final String? avgPentaKills;
  @JsonKey(name: 'Assists')
  final String? assists;
  @JsonKey(name: 'Average Quadro Kills')
  final String? avgQuadroKills;
  @JsonKey(name: 'Average Deaths')
  final String? avgDeaths;
  @JsonKey(name: 'Average K/R Ratio')
  final String? avgKr;
  @JsonKey(name: 'Average Headshots %')
  final String? avgHsPercent;
  @JsonKey(name: 'Rounds')
  final String? rounds;
  @JsonKey(name: 'K/R Ratio')
  final String? krRatio;
  @JsonKey(name: 'K/D Ratio')
  final String? kdRatio;
  @JsonKey(name: 'Average Kills')
  final String? avgKills;
  @JsonKey(name: 'MVPs')
  final String? mvps;
  @JsonKey(name: 'Average Triple Kills')
  final String? avgTripleKills;
  @JsonKey(name: 'Kills')
  final String? kills;
  @JsonKey(name: 'Headshots')
  final String? headshots;
  @JsonKey(name: 'Average K/D Ratio')
  final String? avgKdRatio;
  @JsonKey(name: 'Average MVPs')
  final String? avgMvps;

  PlayerStatsDetailsMapStats(
    this.pentaKills,
    this.deaths,
    this.quadroKills,
    this.matches,
    this.tripleKills,
    this.avgAssists,
    this.wins,
    this.winratePercentage,
    this.hsPerMatch,
    this.totalHsPercent,
    this.avgPentaKills,
    this.assists,
    this.avgQuadroKills,
    this.avgDeaths,
    this.avgKr,
    this.avgHsPercent,
    this.rounds,
    this.krRatio,
    this.kdRatio,
    this.avgKills,
    this.mvps,
    this.avgTripleKills,
    this.kills,
    this.headshots,
    this.avgKdRatio,
    this.avgMvps,
  );

  factory PlayerStatsDetailsMapStats.fromJson(Map<String, dynamic> json) =>
      _$PlayerStatsDetailsMapStatsFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerStatsDetailsMapStatsToJson(this);
}
