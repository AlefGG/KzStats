import 'package:csgostats/csgostats/library/Widgets/Inherited/provider.dart';
import 'package:csgostats/csgostats/ui/widgets/favourite_playes/favourite_players_model.dart';
import 'package:csgostats/csgostats/ui/widgets/favourite_playes/favourite_players_widget.dart';
import 'package:csgostats/csgostats/ui/widgets/main_screen/main_screen_model.dart';
import 'package:csgostats/csgostats/ui/widgets/client_profile/client_profile_widget.dart';
import 'package:csgostats/csgostats/ui/widgets/client_profile/client_profile_model.dart';
import 'package:csgostats/csgostats/ui/widgets/news/news_model.dart';
import 'package:csgostats/csgostats/ui/widgets/news/news_widget.dart';
import 'package:csgostats/csgostats/ui/widgets/player_list/player_list_model.dart';
import 'package:csgostats/csgostats/ui/widgets/player_list/player_list_widget.dart';
import 'package:csgostats/csgostats/ui/widgets/player_list/search_players/search_player_model.dart';
import 'package:csgostats/csgostats/ui/widgets/player_list/search_players/search_player_widget.dart';
import 'package:csgostats/csgostats/ui/widgets/team_list/team_list_model.dart';
import 'package:flutter/material.dart';

import '../team_list/team_list_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 1;
  final newsModel = NewsModel();
  final playerListModel = PlayerListModel();
  final teamListModel = TeamListModel();
  final searchPlayerModel = SearchPlayerModel();
  // final clientProfileModel = ClientProfileModel();
  final favouritePlayersModel = FavouritePlayersModel();

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   playerListModel.loadPlayerRankings();
  // }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // playerListModel.setupRankings();
    playerListModel.setupLocale(context);
    searchPlayerModel.setupLocale(context);
    newsModel.setupLocale(context);
    // playerListModel.loadPlayerRankings();
  }

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvidere.read<MainScreenModel>(context);
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
        actions: [
          IconButton(
            onPressed: () {
              model?.onProfileTap(context);
            },
            icon: const Icon(
              Icons.person_2,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {
              model?.onSearchTap(context);
            },
            icon: const Icon(
              Icons.search,
              size: 30,
            ),
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          NotifierProvidere(
            create: () => newsModel,
            isManagingModel: false,
            child: const NewsWidget(),
          ),
          NotifierProvidere(
            create: () => teamListModel,
            isManagingModel: false,
            child: const TeamListWidget(),
          ),
          NotifierProvidere(
            create: () => playerListModel,
            isManagingModel: false,
            child: const PlayerListWidget(),
          ),
          // NotifierProvidere(
          //   create: () => favouritePlayersModel,
          //   isManagingModel: false,
          //   child: const FavouritePlayersWidget(),
          // )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'news',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people, size: 30),
            label: 'teams',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.man,
              size: 30,
            ),
            label: 'players',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.star),
          //   label: 'Saved Players',
          // ),
        ],
        onTap: onSelectTab,
      ),
    );
  }
}
