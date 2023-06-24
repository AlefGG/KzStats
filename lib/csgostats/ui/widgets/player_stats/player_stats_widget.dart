import 'package:csgostats/csgostats/domain/entity/player_stats_details.dart';
import 'package:csgostats/csgostats/library/Widgets/Inherited/provider.dart';
import 'package:csgostats/csgostats/ui/widgets/player_stats/player_profile_maps_widget.dart';
import 'package:csgostats/csgostats/ui/widgets/player_stats/player_stats_model.dart';
import 'package:csgostats/services/auth.dart';
import 'package:flutter/material.dart';

import 'player_profile_main_info_widget.dart';
import 'player_profile_statistics_widget.dart';

// details: nicname avatar country faceit_elo gamePlayerName
// stats: winrate matches totalHS currentwinStreak KDRatio LongestWinstreak
// AVGKD AVGHS Wins recetResults[]

class PlayerStatsWidget extends StatefulWidget {
  const PlayerStatsWidget({Key? key}) : super(key: key);

  @override
  State<PlayerStatsWidget> createState() => _PlayerStatsWidgetState();
}

class _PlayerStatsWidgetState extends State<PlayerStatsWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    NotifierProvidere.read<PlayerStatsModel>(context)?.setupLocale(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(27, 31, 35, 1),
      appBar: AppBar(
        centerTitle: true,
        title: const _TitleWidget(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
          ),
        ],
      ),
      body: const ColoredBox(
        color: Color.fromRGBO(27, 31, 35, 1),
        child: _BodyWidget(),
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvidere.watch<PlayerStatsModel>(context);
    return Text(
      model?.playerDetails?.nickname.toString() ?? 'Loading',
      style: const TextStyle(
          fontFamily: 'Play', fontWeight: FontWeight.bold, fontSize: 20),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvidere.watch<PlayerStatsModel>(context);
    final playerDetails = model?.playerDetails;
    final playerStats = model?.playerStatsDetails;
    final coverImage = model?.playerDetails?.coverImage;

    if (playerDetails == null || playerStats == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: AspectRatio(
            aspectRatio: 387 / 97.9,
            child: coverImage != ''
                ? _PlayerBgImageWidget(image: coverImage)
                : const Image(
                    image: AssetImage('assets/images/defaultBg.jpeg')),
          ),
        ),
        //upper part where avatar is
        const PlayerProfileMainInfoWidget(),
        //lower part with stats
        const PlayerProfileMainStatisticsWidget(),
        //maps stats widget
        const MainStatisticsMapsWidget(),
      ],
    );
  }
}

class _PlayerBgImageWidget extends StatelessWidget {
  final String? image;
  const _PlayerBgImageWidget({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 0),
      child: ClipRRect(
        child: Image.network(image ??
            'https://assets.faceit-cdn.net/users_covers/19606e0c-137b-4885-a904-744fa12d25f6_1550753647052.jpg'),
      ),
    );
  }
}
