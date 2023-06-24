import 'package:csgostats/csgostats/Theme/constats.dart';
import 'package:csgostats/csgostats/domain/entity/search_player/search_player_items.dart';
import 'package:csgostats/csgostats/library/Widgets/Inherited/provider.dart';
import 'package:csgostats/csgostats/ui/widgets/player_list/search_players/search_player_model.dart';
import 'package:flutter/material.dart';

class SearchPlayersWidget extends StatelessWidget {
  const SearchPlayersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvidere.watch<SearchPlayerModel>(context);
    if (model == null) return const SizedBox.shrink();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(27, 31, 35, 1),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'FACEIT',
          style: TextStyle(
            fontFamily: 'Play',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            padding: const EdgeInsets.only(top: 98),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: model.players.length,
            itemBuilder: (BuildContext context, int index) {
              model.showedSearchedPlayerAtIndex(index);
              final player = model.players[index];
              return playerInfoRow(player, model, context, index);
            },
          ),
          _SearchBar(model: model),
          // Padding(
          //   padding: const EdgeInsets.all(10),
          //   child: TextField(
          //     onChanged: model.searchPlayer,
          //     decoration: InputDecoration(
          //       labelText: 'Search',
          //       filled: true,
          //       fillColor: Colors.white.withAlpha(235),
          //       border: const OutlineInputBorder(),
          //     ),
          //   ),
          // ),
          const RowHeaderWidget(),
        ],
      ),
    );
  }

  Container playerInfoRow(
    SearchPlayerItems player,
    SearchPlayerModel model,
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
                  player.country.toString(),
                  style: listDefaultTextStyle,
                ),
              ),
              const SizedBox(width: 20),
              SizedBox(
                child: Text(
                  textAlign: TextAlign.center,
                  player.status.toString(),
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

class _SearchBar extends StatelessWidget {
  const _SearchBar({
    super.key,
    required this.model,
  });

  final SearchPlayerModel model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        onChanged: model.searchPlayer,
        decoration: InputDecoration(
          hintText: 'Search',
          filled: true,
          fillColor: Colors.white.withAlpha(235),
          border: const OutlineInputBorder(),
        ),
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
      padding: const EdgeInsets.only(top: 60.0),
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
            Text(
              'Nickname',
              style: listDefaultTextStyle,
            ),
            SizedBox(width: 50),
            Text(
              'Country',
              style: listDefaultTextStyle,
            ),
            SizedBox(width: 20),
            Text(
              'Status',
              style: listDefaultTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
