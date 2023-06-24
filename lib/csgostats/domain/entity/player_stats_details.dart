import 'package:json_annotation/json_annotation.dart';

part 'player_stats_details.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PlayerStatsDetails {
  @JsonKey(name: 'K/D Ratio', fromJson: _parseKd)
  final String? KDRatio;
  @JsonKey(name: 'Matches', fromJson: _parseMatches)
  final String? matches;
  @JsonKey(name: 'Wins', fromJson: _parseMatches)
  final String? wins;
  @JsonKey(name: 'Average Headshots %')
  final String? avgHsPercent;
  @JsonKey(name: 'Win Rate %')
  final String? winRatePercent;
  @JsonKey(name: 'Current Win Streak')
  final String? currentWinStreak;
  @JsonKey(name: 'Average K/D Ratio')
  final String? avgKdRatio;
  @JsonKey(name: 'Longest Win Streak')
  final String? longestWinStreak;
  @JsonKey(name: 'Total Headshots %')
  final String? totalHsPercent;
  @JsonKey(name: 'Recent Results', fromJson: _parseRecentResults)
  final List<dynamic>? recentResults;

  PlayerStatsDetails(
    this.KDRatio,
    this.matches,
    this.wins,
    this.avgHsPercent,
    this.winRatePercent,
    this.currentWinStreak,
    this.avgKdRatio,
    this.longestWinStreak,
    this.totalHsPercent,
    this.recentResults,
  );

  factory PlayerStatsDetails.fromJson(Map<String, dynamic> json) =>
      _$PlayerStatsDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerStatsDetailsToJson(this);

  static String? _parseKd(String? nick) {
    if (nick == null || nick.isEmpty) return '0.00';
    return nick;
  }

  static List<dynamic>? _parseRecentResults(List<dynamic>? results) {
    if (results == null || results.isEmpty) return ['W', 'W', 'W', 'W', 'W'];
    return results;
  }

  static String? _parseMatches(String? results) {
    if (results == null || results.isEmpty) return '1000';
    return results;
  }
}
