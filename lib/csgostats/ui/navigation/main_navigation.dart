import 'package:csgostats/csgostats/ui/widgets/auth/auth_model.dart';
import 'package:csgostats/csgostats/ui/widgets/auth/auth_widget.dart';
import 'package:csgostats/csgostats/ui/widgets/client_profile/client_profile_model.dart';
import 'package:csgostats/csgostats/ui/widgets/client_profile/client_profile_settings/client_profile_settings_widget.dart';
import 'package:csgostats/csgostats/ui/widgets/client_profile/client_profile_settings/client_profile_settings_model.dart';
import 'package:csgostats/csgostats/ui/widgets/client_profile/client_profile_widget.dart';
import 'package:csgostats/csgostats/ui/widgets/main_screen/main_screen_model.dart';
import 'package:csgostats/csgostats/ui/widgets/main_screen/main_screen_widget.dart';
import 'package:csgostats/csgostats/ui/widgets/player_stats/player_stats_model.dart';
import 'package:csgostats/csgostats/ui/widgets/player_stats/player_stats_widget.dart';
import 'package:csgostats/csgostats/ui/widgets/player_list/search_players/search_player_model.dart';
import 'package:csgostats/csgostats/ui/widgets/player_list/search_players/search_player_widget.dart';
import 'package:csgostats/csgostats/library/Widgets/Inherited/provider.dart';
import 'package:flutter/material.dart';

class NotifierProvider extends StatefulWidget {
  NotifierProvider({Key? key}) : super(key: key);

  @override
  State<NotifierProvider> createState() => _NotifierProviderState();
}

class _NotifierProviderState extends State<NotifierProvider> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

abstract class MainNavigationRouteNames {
  static const auth = 'auth';
  static const mainScreen = '/';
  static const playerStats = '/player_stats';
  static const searchPlayer = '/search_player';
  static const clientProfile = '/client_profile';
  static const clientProfileSettings =
      '/client_profile/client_profile_settings';
}

class MainNavigation {
  String initialRoute(bool isAuth) => isAuth
      ? MainNavigationRouteNames.mainScreen
      : MainNavigationRouteNames.mainScreen;

  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.auth: (context) => NotifierProvidere(
          create: () => AuthModel(),
          child: const AuthWidget(),
        ),
    MainNavigationRouteNames.mainScreen: (context) => NotifierProvidere(
          create: () => MainScreenModel(),
          child: const MainScreenWidget(),
        ),
    MainNavigationRouteNames.searchPlayer: (context) => NotifierProvidere(
          create: () => SearchPlayerModel(),
          child: const SearchPlayersWidget(),
        ),
    MainNavigationRouteNames.clientProfile: (context) => NotifierProvidere(
          create: () => ClientProfileModel(),
          child: const ClientProfileWidget(),
        ),
    MainNavigationRouteNames.clientProfileSettings: (context) =>
        NotifierProvidere(
          create: () => ClientProfileSettingsModel(),
          child: ClientProfileSettingsWidget(),
        ),
  };
  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.playerStats:
        final arguments = settings.arguments;
        // final playerId = arguments is int ? arguments : 0;
        final playerId = arguments is String
            ? arguments
            : 'f38eab56-7b9c-4083-84e9-329b73e8e32e';

        return MaterialPageRoute(
          builder: (context) => NotifierProvidere(
            create: () => PlayerStatsModel(playerId as String),
            child: const PlayerStatsWidget(),
          ),
        );

      case MainNavigationRouteNames.searchPlayer:
        final arguments = settings.arguments;
        return MaterialPageRoute(
          // NotifierProvidere(
          //   create: () => clientProfileModel,
          //   isManagingModel: false,
          //   child: const ClientProfileWidget(),
          // )
          builder: (context) => NotifierProvidere(
            create: () => SearchPlayerModel(),
            isManagingModel: false,
            child: const SearchPlayersWidget(),
          ),
        );

      case MainNavigationRouteNames.clientProfile:
        final arguments = settings.arguments;
        return MaterialPageRoute(
          // NotifierProvidere(
          //   create: () => clientProfileModel,
          //   isManagingModel: false,
          //   child: const ClientProfileWidget(),
          // )
          builder: (context) => NotifierProvidere(
            create: () => ClientProfileModel(),
            isManagingModel: false,
            child: const ClientProfileWidget(),
          ),
        );

      case MainNavigationRouteNames.clientProfileSettings:
        final arguments = settings.arguments;
        return MaterialPageRoute(
          // NotifierProvidere(
          //   create: () => clientProfileModel,
          //   isManagingModel: false,
          //   child: const ClientProfileWidget(),
          // )
          builder: (context) => NotifierProvidere(
            create: () => ClientProfileSettingsModel(),
            isManagingModel: false,
            child: ClientProfileSettingsWidget(),
          ),
        );
      default:
        const widget = Text('Navigation error');
        return MaterialPageRoute(builder: (context) => widget);
    }
  }
}
