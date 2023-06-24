import 'package:csgostats/csgostats/Theme/constats.dart';
import 'package:csgostats/csgostats/library/Widgets/Inherited/provider.dart';
import 'package:csgostats/csgostats/ui/widgets/player_stats/player_profile_maps_widget.dart';
import 'package:csgostats/csgostats/ui/widgets/player_stats/player_stats_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PlayerProfileMainStatisticsWidget extends StatelessWidget {
  const PlayerProfileMainStatisticsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final nickname, gamePlayerName, recentResults;
    final model = NotifierProvidere.watch<PlayerStatsModel>(context);
    gamePlayerName = model?.playerDetails?.steamNickname;
    nickname = model?.playerDetails?.nickname;

    if (nickname == null) {
      return const SizedBox.shrink();
    } else {
      return Container(
        margin: const EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: 10,
        ),
        color: const Color.fromRGBO(45, 56, 68, 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    nickname,
                    style: listDefaultHeaderStyle,
                  ),
                  Text(
                    gamePlayerName,
                    style: listDefaultHeaderStyle,
                  )
                ],
              ),
            ),
            //main stats where faceit elo etc
            _MainStatisticsWidget(nickname: nickname),
          ],
        ),
      );
    }
  }
}

class _MainStatisticsWidget extends StatelessWidget {
  final String nickname;
  static const digitStyle = TextStyle(
    color: Color.fromRGBO(146, 154, 158, 1),
    fontSize: 16,
  );
  static const divider = Divider(
    color: Color.fromRGBO(73, 88, 103, 0.45),
    thickness: 2,
  );
  _MainStatisticsWidget({Key? key, required this.nickname}) : super(key: key);

  final textStyle = PlayerProfileMainStatisticsWidget;

  @override
  Widget build(BuildContext context) {
    late final faceitElo,
        avgKdRatio,
        avgHsPercent,
        winRatePercent,
        matches,
        wins,
        loses,
        currentWinStreak,
        faceitLink;

    final model = NotifierProvidere.watch<PlayerStatsModel>(context);
    if (model?.playerStatsDetails?.lifetimeStatistics?.wins != null) {
      faceitElo = model?.playerDetails?.games?.csgo?.faceitElo;
      avgKdRatio = model?.playerStatsDetails?.lifetimeStatistics?.avgKdRatio;
      avgHsPercent =
          model?.playerStatsDetails?.lifetimeStatistics?.avgHsPercent;
      winRatePercent =
          model?.playerStatsDetails?.lifetimeStatistics?.winRatePercent;
      matches = model?.playerStatsDetails?.lifetimeStatistics?.matches;
      wins = model?.playerStatsDetails?.lifetimeStatistics?.wins;
      loses = int.parse(matches) - int.parse(wins);
      currentWinStreak =
          model?.playerStatsDetails?.lifetimeStatistics?.currentWinStreak;
      faceitLink = model?.playerDetails?.faceitUrl;
    } else {
      faceitElo = '1000';
      avgKdRatio = '1';
      avgHsPercent = '50';
      winRatePercent = '50';
      matches = '100';
      wins = '50';
      loses = '50';
      currentWinStreak = '0';
      faceitLink = ' ';
    }
    if (model?.playerStatsDetails?.lifetimeStatistics?.wins == null) {
      return Container(
        // padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        // margin: const EdgeInsets.symmetric(horizontal: 30),
        color: const Color.fromRGBO(54, 66, 80, 1),
        child: Column(
          children: const [
            _StatisticsRowsWidget('Error', ''),
            divider,
            _StatisticsRowsWidget('Account not found', ''),
            divider,
          ],
        ),
      );
    }
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 30),
      color: const Color.fromRGBO(54, 66, 80, 1),
      child: Column(
        children: [
          _StatisticsRowsWidget('Faceit Elo', faceitElo.toString()),
          divider,
          _StatisticsRowsWidget('Kill/Death Ratio', avgKdRatio),
          divider,
          _StatisticsRowsWidget('Average Headshots %', '$avgHsPercent%'),
          divider,
          _StatisticsRowsWidget('Winrate', '$winRatePercent%'),
          divider,
          _StatisticsRowsWidget(
              'Matches Wins Loses', '$matches/$wins/${loses.toString()}'),
          divider,
          _StatisticsRowsWidget('current winstreak', currentWinStreak),
          divider,
          _Links(nickname: nickname),
        ],
      ),
    );
  }
}

class _StatisticsRowsWidget extends StatelessWidget {
  final digitStyle = _MainStatisticsWidget.digitStyle;
  const _StatisticsRowsWidget(
    this.statisticDescription,
    this.statisticsData,
  );
  final String statisticDescription;
  final String statisticsData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            statisticDescription,
            style: listDefaultTextStyle,
          ),
          Text(
            statisticsData,
            style: listDefaultTextStyle,
          ),
        ],
      ),
    );
  }
}

class _Links extends StatelessWidget {
  final nickname;
  const _Links({Key? key, required this.nickname}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Uri _url = Uri.parse('https://www.faceit.com/en/players/$nickname');
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      ElevatedButton.icon(
        style: signupStyle,
        label: const Text('faceit Url'),
        onPressed: () async {
          await launchUrl(_url);
        },
        icon: const Icon(Icons.link),
      ),
    ]);
  }
}
