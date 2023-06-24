import 'package:csgostats/csgostats/Theme/constats.dart';
import 'package:csgostats/csgostats/domain/entity/player_rankings.dart';
import 'package:csgostats/csgostats/library/Widgets/Inherited/provider.dart';
import 'package:csgostats/csgostats/ui/navigation/main_navigation.dart';
import 'package:csgostats/csgostats/ui/widgets/player_list/player_list_model.dart';
import 'package:flutter/material.dart';

class PlayerListWidget extends StatelessWidget {
  const PlayerListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvidere.watch<PlayerListModel>(context);
    if (model == null) return const SizedBox.shrink();
    return Stack(
      children: [
        ListView.builder(
          padding: const EdgeInsets.only(top: 38),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: model.playerRankings.length,
          itemBuilder: (BuildContext context, int index) {
            model.showedPlayerAtIndex(index);
            final player = model.playerRankings[index];
            return playerInfoRow(player, model, context, index);
          },
        ),
        const RowHeaderWidget(),
      ],
    );
  }

  Container playerInfoRow(
    PlayerRankings player,
    PlayerListModel model,
    BuildContext context,
    int index,
  ) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(45, 56, 68, 1),
        border: Border.all(color: Colors.grey),
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 30,
                child: Text(
                  player.position.toString(),
                  style: listDefaultTextStyle,
                ),
              ),
              FittedBox(
                child: Text(
                  textAlign: TextAlign.start,
                  player.nickname.toString(),
                  style: listDefaultTextStyle,
                ),
              ),
              const Spacer(),
              SizedBox(
                child: Text(
                  textAlign: TextAlign.center,
                  player.faceitElo.toString(),
                  style: listDefaultTextStyle,
                ),
              ),
              const SizedBox(width: 30),
              SizedBox(
                child: Text(
                  textAlign: TextAlign.center,
                  player.gameSkillLevel.toString(),
                  style: listDefaultTextStyle,
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                child: Column(
                  children: const [
                    SizedBox(height: 9),
                    Image(
                      height: 33,
                      image: AssetImage(
                          'assets/images/GAlByJtDTnkgbb9p_71SUL.webp'),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              const SizedBox(
                width: 50,
                child: Image(
                  image: AssetImage('assets/images/KZ.webp'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => model.onPlayerTap(context, index),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RowHeaderWidget extends StatelessWidget {
  const RowHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(color: Color.fromRGBO(146, 154, 158, 1));
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(45, 56, 68, 1),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            SizedBox(width: 10),
            Text('Rank', style: listDefaultTextStyle),
            SizedBox(width: 5),
            Text('Nickname', style: listDefaultTextStyle),
            SizedBox(width: 55),
            Text('Faceit Elo', style: listDefaultTextStyle),
            SizedBox(width: 10),
            Text('Level', style: listDefaultTextStyle),
            SizedBox(width: 40),
            Text('Country', style: listDefaultTextStyle)
          ],
        ),
      ),
    );
  }
}
