import 'package:csgostats/csgostats/domain/api_client/api_client_faceit.dart';
import 'package:csgostats/csgostats/domain/entity/player_details/player_details_response.dart';
import 'package:csgostats/csgostats/domain/entity/player_stats_details.dart';
import 'package:csgostats/csgostats/domain/entity/player_stats_details_response.dart';
import 'package:csgostats/csgostats/ui/navigation/main_navigation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClientProfileModel extends ChangeNotifier {
  void onPlayerTap(BuildContext context, String id) {
    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.playerStats,
      arguments: id,
    );
  }

  void onSettingsTap(BuildContext context) {
    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.clientProfileSettings,
    );
  }

  void onDeleteTap(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(MainNavigationRouteNames.auth);
  }
}
