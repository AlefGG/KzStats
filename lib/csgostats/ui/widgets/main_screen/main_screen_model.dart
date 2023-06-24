import 'package:csgostats/csgostats/ui/navigation/main_navigation.dart';
import 'package:flutter/material.dart';

class MainScreenModel extends ChangeNotifier {
  void onSearchTap(BuildContext context) {
    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.searchPlayer,
    );
  }

  void onProfileTap(BuildContext context) {
    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.clientProfile,
    );
  }
}
