// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_stats_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerStatsDetails _$PlayerStatsDetailsFromJson(Map<String, dynamic> json) =>
    PlayerStatsDetails(
      PlayerStatsDetails._parseKd(json['K/D Ratio'] as String?),
      PlayerStatsDetails._parseMatches(json['Matches'] as String?),
      PlayerStatsDetails._parseMatches(json['Wins'] as String?),
      json['Average Headshots %'] as String?,
      json['Win Rate %'] as String?,
      json['Current Win Streak'] as String?,
      json['Average K/D Ratio'] as String?,
      json['Longest Win Streak'] as String?,
      json['Total Headshots %'] as String?,
      PlayerStatsDetails._parseRecentResults(json['Recent Results'] as List?),
    );

Map<String, dynamic> _$PlayerStatsDetailsToJson(PlayerStatsDetails instance) =>
    <String, dynamic>{
      'K/D Ratio': instance.KDRatio,
      'Matches': instance.matches,
      'Wins': instance.wins,
      'Average Headshots %': instance.avgHsPercent,
      'Win Rate %': instance.winRatePercent,
      'Current Win Streak': instance.currentWinStreak,
      'Average K/D Ratio': instance.avgKdRatio,
      'Longest Win Streak': instance.longestWinStreak,
      'Total Headshots %': instance.totalHsPercent,
      'Recent Results': instance.recentResults,
    };
