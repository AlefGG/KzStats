import 'package:csgostats/csgostats/Theme/constats.dart';
import 'package:csgostats/csgostats/domain/api_client/api_client_faceit.dart';
import 'package:csgostats/csgostats/library/Widgets/Inherited/provider.dart';
import 'package:csgostats/csgostats/ui/widgets/player_stats/player_stats_model.dart';
import 'package:flutter/material.dart';

class PlayerProfileMainInfoWidget extends StatelessWidget {
  const PlayerProfileMainInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      color: const Color.fromRGBO(45, 56, 68, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          //left side where nick is
          _PlayerMainInformationWidget(),
          //avatar widget
          _PlayerPictureWidget(),
        ],
      ),
    );
  }
}

class _PlayerMainInformationWidget extends StatelessWidget {
  const _PlayerMainInformationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final nickname, gamePlayerName;
    var recentResults;
    final model = NotifierProvidere.watch<PlayerStatsModel>(context);
    nickname = model?.playerDetails?.nickname;
    gamePlayerName = model?.playerDetails?.steamNickname;
    recentResults =
        model?.playerStatsDetails?.lifetimeStatistics?.recentResults;
    final List recentResultsToString = ['W', 'W', 'W', 'W', 'W'];
    if (recentResults == null) {
      recentResults = recentResultsToString;
    } else {
      for (int i = 0; i < recentResultsToString.length; i++) {
        if (recentResults[i] == '0') {
          recentResultsToString[i] = 'L';
        } else {
          recentResultsToString[i] = 'W';
        }
      }
    }

    var _textStyleWL = const TextStyle(
      fontSize: 16,
      color: Color.fromRGBO(219, 230, 243, 1),
      fontWeight: FontWeight.bold,
      fontFamily: 'Play',
    );

    if (nickname == null) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 30),
        color: const Color.fromRGBO(54, 66, 80, 1),
        child: const Text(
          'Error: Account not found',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w400,
            fontFamily: 'Play',
          ),
        ),
      );
    } else {
      return SizedBox(
        width: 250,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                nickname,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Play',
                ),
              ),
              Row(
                children: [
                  const Image(
                    height: 12,
                    image: AssetImage('assets/images/KZ.webp'),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    gamePlayerName,
                    style: listDefaultTextStyle,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: const [
                  Text(
                    'Faceit Level',
                    style: listDefaultTextStyle,
                  ),
                  SizedBox(width: 10),
                  Text(
                    '10',
                    style: listDefaultTextStyle,
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text(
                    'Recent results',
                    style: listDefaultTextStyle,
                  ),
                  const SizedBox(width: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(recentResultsToString[0], style: _textStyleWL),
                      const SizedBox(width: 3),
                      Text(recentResultsToString[1], style: _textStyleWL),
                      const SizedBox(width: 3),
                      Text(recentResultsToString[2], style: _textStyleWL),
                      const SizedBox(width: 3),
                      Text(recentResultsToString[3], style: _textStyleWL),
                      const SizedBox(width: 3),
                      Text(recentResultsToString[4], style: _textStyleWL),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }
  }
}

class _PlayerPictureWidget extends StatelessWidget {
  const _PlayerPictureWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvidere.watch<PlayerStatsModel>(context);
    final avatar = model?.playerDetails?.avatar;
    // ApiClientFaceit.ima

    if (model?.playerStatsDetails?.lifetimeStatistics?.wins == null) {
      return const Center(child: SizedBox.shrink());
    } else {
      return SizedBox(
        width: 140,
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            avatar != ''
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(avatar!),
                  )
                : const Image(
                    fit: BoxFit.cover,
                    alignment: FractionalOffset.topCenter,
                    image: AssetImage(
                        'assets/images/GAlByJtDTnkgbb9p_71SUL (1).webp'),
                  ),
          ],
        ),
      );
    }
  }
}
