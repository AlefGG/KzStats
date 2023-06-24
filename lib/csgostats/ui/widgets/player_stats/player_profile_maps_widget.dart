import 'package:csgostats/csgostats/Theme/constats.dart';
import 'package:csgostats/csgostats/domain/entity/player_stats_details_segments.dart';
import 'package:csgostats/csgostats/library/Widgets/Inherited/provider.dart';
import 'package:csgostats/csgostats/ui/widgets/player_stats/player_stats_model.dart';
import 'package:flutter/material.dart';

class MainStatisticsMapsWidget extends StatelessWidget {
  const MainStatisticsMapsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvidere.watch<PlayerStatsModel>(context);
    int? mrgId, vertId, overId, nukeId, infId, ancientId, anubisId;

    for (int i = 0;
        i < (model?.playerStatsDetails?.segments?.length ?? 0);
        i++) {
      if (model?.playerStatsDetails?.segments?[i].mode == '5v5') {
        switch (model?.playerStatsDetails?.segments?[i].label) {
          case 'de_mirage':
            mrgId = i;
            break;
          case 'de_vertigo':
            vertId = i;
            break;

          case 'de_overpass':
            overId = i;
            break;

          case 'de_nuke':
            nukeId = i;
            break;
          case 'de_inferno':
            infId = i;
            break;

          case 'de_ancient':
            ancientId = i;
            break;
          case 'de_anubis':
            anubisId = i;
            break;
          default:
            break;
        }
      }
    }
    final kd = double.parse(
        model?.playerStatsDetails?.lifetimeStatistics?.avgKdRatio ?? '0');
    final hs = int.parse(
        model?.playerStatsDetails?.lifetimeStatistics?.avgHsPercent ?? '0');
    final int elo = model?.playerDetails?.games?.csgo?.faceitElo ?? 1;
    final mrg = model?.playerStatsDetails?.segments?[mrgId ?? 0];
    final vert = model?.playerStatsDetails?.segments?[vertId ?? 0];
    final ancient = model?.playerStatsDetails?.segments?[ancientId ?? 0];
    final over = model?.playerStatsDetails?.segments?[overId ?? 0];
    final anubis = model?.playerStatsDetails?.segments?[anubisId ?? 0];
    final nuke = model?.playerStatsDetails?.segments?[nukeId ?? 0];
    final inf = model?.playerStatsDetails?.segments?[infId ?? 0];

    int totalMatches = 0;
    int minMatches = 9999;
    int minMatchesId = 0;
    int maxMatches = -9999;
    int maxMatchesId = 0;
    int totalMvps = 0;
    int totalAces = 0, totalQuadros = 0, totalTriples = 0;
    double roleRatio = 0, positionRatio = 0, varietyRatio = 0;

    var maps = [mrg, vert, ancient, over, anubis, nuke, inf];

    for (int i = 0; i < maps.length; i++) {
      totalMatches += int.parse(maps[i]?.stats.matches ?? '0');
      totalMvps += int.parse(maps[i]?.stats.mvps ?? '0');
      totalAces += int.parse(maps[i]?.stats.pentaKills ?? '0');
      totalQuadros += int.parse(maps[i]?.stats.quadroKills ?? '0');
      totalTriples += int.parse(maps[i]?.stats.tripleKills ?? '0');
      if (int.parse(maps[i]?.stats.matches ?? '0') < minMatches) {
        minMatches = int.parse(maps[i]?.stats.matches ?? '0');
        minMatchesId = i;
      }
      if (int.parse(maps[i]?.stats.matches ?? '0') > maxMatches) {
        maxMatches = int.parse(maps[i]?.stats.matches ?? '0');
        maxMatchesId = i;
      }
    }

    double growthTempo = (elo / (totalMatches * 2));

    double highlightPotential =
        ((totalMvps + (totalAces * 5 + totalQuadros * 4 + totalTriples * 3)) /
                totalMatches) *
            10;

    double avgMatches = totalMatches / 7;
    String mapsVariety = '';
    if (minMatches < avgMatches * 0.5) {
      mapsVariety = 'poor';
      varietyRatio = 0.5;
    } else if (minMatches < avgMatches * 0.75 &&
        minMatches > avgMatches * 0.5) {
      mapsVariety = 'average';
      varietyRatio = minMatches / avgMatches * 0.75;
    } else {
      mapsVariety = 'good';
      varietyRatio = minMatches / avgMatches;
    }

    String role = '';
    String position = '';
    if (kd > 0.89 && kd < 1.1) {
      role = 'lurker';
      roleRatio = kd;
    } else if (kd >= 1.1 && kd < 1.27) {
      role = 'support';
      roleRatio = kd;
    } else if (kd >= 1.27) {
      roleRatio = kd;
      role = 'star player';
    } else {
      roleRatio = kd;
      role = 'captain';
    }

    if (hs < 45) {
      position = 'sniper';
    } else if (hs >= 45 && hs < 55) {
      position = 'entry fragger';
    } else {
      position = 'support';
    }

    double rating = ((elo / 1000) *
            (growthTempo / 4) *
            roleRatio *
            varietyRatio *
            highlightPotential) /
        50;

    if (totalMatches != 0) {
      return Column(
        children: [
          _SelfStatsWidget(
            maps: maps,
            totalMatches: totalMatches,
            minMatches: minMatches,
            minMatchesId: minMatchesId,
            maxMatches: maxMatches,
            maxMatchesId: maxMatchesId,
            avgMatches: avgMatches,
            mapsVariety: mapsVariety,
            role: role,
            position: position,
            highlightPotential: highlightPotential,
            growthTempo: growthTempo,
            rating: rating,
            varietyRatio: varietyRatio,
          ),
          _MapStatsWidget(map: mrg),
          _MapStatsWidget(map: vert),
          _MapStatsWidget(map: ancient),
          _MapStatsWidget(map: over),
          _MapStatsWidget(map: anubis),
          _MapStatsWidget(map: nuke),
          _MapStatsWidget(map: inf),
        ],
      );
    } else {
      return SizedBox.shrink();
    }
  }
}

class _SelfStatsWidget extends StatelessWidget {
  const _SelfStatsWidget({
    super.key,
    required this.maps,
    required this.minMatches,
    required this.minMatchesId,
    required this.maxMatches,
    required this.maxMatchesId,
    required this.totalMatches,
    required this.avgMatches,
    required this.mapsVariety,
    required this.role,
    required this.position,
    required this.highlightPotential,
    required this.growthTempo,
    required this.rating,
    required this.varietyRatio,
  });
  final List maps;
  final int minMatches;
  final int minMatchesId;
  final int maxMatches;
  final int maxMatchesId;
  final int totalMatches;
  final double avgMatches;
  final String mapsVariety;
  final String role;
  final String position;
  final double highlightPotential;
  final double growthTempo;
  final double rating;
  final double varietyRatio;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      color: const Color.fromRGBO(45, 56, 68, 1),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 30),
        color: const Color.fromRGBO(54, 66, 80, 1),
        child: Column(
          children: [
            const Text(
              "PLAYER'S RATING",
              style: listDefaultHeaderStyle,
            ),
            divider,
            PlayersRatingRow(totalMatches: totalMatches),
            _PlayersMapsRatingRowWidget(
                maps: maps,
                matchesId: maxMatchesId,
                matches: maxMatches,
                title: 'Most played map:'),
            _PlayersMapsRatingRowWidget(
                maps: maps,
                matchesId: minMatchesId,
                matches: minMatches,
                title: 'Least played map:'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Maps variety',
                  style: listDefaultTextStyle,
                ),
                Text(
                  '$mapsVariety - ($varietyRatio)',
                  style: listDefaultHeaderStyle,
                ),
              ],
            ),
            divider,
            _PlayersRatingRowWidgetTwo(text: 'Team role', data: role),
            _PlayersRatingRowWidgetTwo(text: 'Team position:', data: position),
            _PlayersRatingRowWidgetTwo(
                text: 'Hightlight potential:',
                data: highlightPotential.toStringAsFixed(2)),
            divider,
            _PlayersRatingRowWidgetTwo(
                text: 'Growth tempo', data: growthTempo.toStringAsFixed(2)),
            _PlayersRatingRowWidgetTwo(
                text: 'Overall rating', data: rating.toStringAsFixed(2)),
          ],
        ),
      ),
    );
  }
}

class _PlayersRatingRowWidgetTwo extends StatelessWidget {
  const _PlayersRatingRowWidgetTwo({
    super.key,
    required this.data,
    required this.text,
  });

  final String data;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: listDefaultTextStyle,
        ),
        Text(
          data,
          style: listDefaultHeaderStyle,
        ),
      ],
    );
  }
}

class _PlayersMapsRatingRowWidget extends StatelessWidget {
  const _PlayersMapsRatingRowWidget({
    super.key,
    required this.maps,
    required this.matchesId,
    required this.matches,
    required this.title,
  });

  final List maps;
  final int matchesId;
  final int? matches;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: listDefaultTextStyle,
        ),
        Row(
          children: [
            Text(
              '${maps[matchesId].label}',
              style: listDefaultHeaderStyle,
            ),
            Text(
              matches != null ? ' - ($matches)' : '',
              style: listDefaultHeaderStyle,
            ),
          ],
        ),
      ],
    );
  }
}

class PlayersRatingRow extends StatelessWidget {
  const PlayersRatingRow({
    super.key,
    required this.totalMatches,
  });

  final int totalMatches;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Total matches:",
          style: listDefaultTextStyle,
        ),
        Text(
          '$totalMatches',
          style: listDefaultHeaderStyle,
        )
      ],
    );
  }
}

class _MapStatsWidget extends StatelessWidget {
  const _MapStatsWidget({
    super.key,
    required this.map,
  });

  final PlayerStatsDetailsSegments? map;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      color: const Color.fromRGBO(45, 56, 68, 1),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 30),
        color: const Color.fromRGBO(54, 66, 80, 1),
        child: Column(
          children: [
            _MapStatisticsHeaderWidget(
              map?.imgSmall ??
                  'https://cdn.faceit.com/static/stats_assets/csgo/maps/200x125/csgo-votable-maps-de_train-200x125.jpg',
              map?.label ?? 'de_null',
            ),
            _MapStatisticsRowWidget(
              map?.stats.wins ?? '0',
              map?.stats.matches ?? '0',
              map?.stats.winratePercentage ?? '0',
              map?.stats.kills ?? '0',
              map?.stats.deaths ?? '0',
              map?.stats.headshots ?? '0',
              map?.stats.assists ?? '0',
              map?.stats.mvps ?? '0',
              map?.stats.rounds ?? '0',
              map?.stats.pentaKills ?? '0',
              map?.stats.quadroKills ?? '0',
              map?.stats.tripleKills ?? '0',
            ),
          ],
        ),
      ),
    );
  }
}

class _MapStatisticsHeaderWidget extends StatelessWidget {
  const _MapStatisticsHeaderWidget(
    this.imgRegular,
    this.label,
  );
  final String imgRegular;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(imgRegular),
          Text(
            label,
            style: listDefaultHeaderStyle,
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}

class _MapStatisticsRowWidget extends StatelessWidget {
  const _MapStatisticsRowWidget(
    this.wins,
    this.matches,
    this.winrate,
    this.kills,
    this.deaths,
    this.headshots,
    this.assists,
    this.mvps,
    this.rounds,
    this.aces,
    this.quadros,
    this.triples,
  );
  final String wins;
  final String matches;
  final String winrate;
  final String kills;
  final String deaths;
  final String headshots;
  final String assists;
  final String mvps;
  final String rounds;
  final String aces;
  final String quadros;
  final String triples;

  @override
  Widget build(BuildContext context) {
    final String loses = (int.parse(matches) - int.parse(wins)).toString();
    final String kd = (int.parse(kills) / int.parse(deaths)).toStringAsFixed(2);
    final String hsPercentage =
        (int.parse(headshots) / int.parse(kills) * 100).toStringAsFixed(0);
    final String mvpPercentage =
        (int.parse(mvps) / int.parse(rounds) * 100).toStringAsFixed(0);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          divider,
          const Text(
            'Matches/Wins/Loses',
            style: listDefaultHeaderStyle,
          ),
          Text(
            '$matches/$wins/$loses',
            style: listDefaultTextStyle,
          ),
          const Text(
            'WINRATE',
            style: listDefaultHeaderStyle,
          ),
          Text('$winrate%', style: listDefaultTextStyle),
          divider,
          const Text(
            'Kills/Deaths/Assists',
            style: listDefaultHeaderStyle,
          ),
          Text('$kills/$deaths/$assists', style: listDefaultTextStyle),
          const Text(
            'K/D Ratio',
            style: listDefaultHeaderStyle,
          ),
          Text(kd, style: listDefaultTextStyle),
          divider,
          const Text(
            'HeadShots',
            style: listDefaultHeaderStyle,
          ),
          Text(headshots, style: listDefaultTextStyle),
          const Text(
            'HS percentage',
            style: listDefaultHeaderStyle,
          ),
          Text('$hsPercentage%', style: listDefaultTextStyle),
          divider,
          const Text(
            'Most Valuable Player, times',
            style: listDefaultHeaderStyle,
          ),
          Text(mvps, style: listDefaultTextStyle),
          const Text(
            'MVP percentage',
            style: listDefaultHeaderStyle,
          ),
          Text('$mvpPercentage%', style: listDefaultTextStyle),
          divider,
          const Text(
            'Aces/Quadros/Triples',
            style: listDefaultHeaderStyle,
          ),
          Text('$aces/$quadros/$triples', style: listDefaultTextStyle),
        ],
      ),
    );
  }
}
