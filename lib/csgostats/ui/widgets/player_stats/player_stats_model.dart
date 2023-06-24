import 'package:csgostats/csgostats/domain/api_client/api_client_faceit.dart';
import 'package:csgostats/csgostats/domain/entity/player_details/player_details_response.dart';
import 'package:csgostats/csgostats/domain/entity/player_stats_details.dart';
import 'package:csgostats/csgostats/domain/entity/player_stats_details_response.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class PlayerStatsModel extends ChangeNotifier {
  final _apiClient = ApiClientFaceit();

  final String playerId;
  // late final String _locale;
  late DateFormat _dateFormat;
  PlayerStatsDetailsResponse? _playerStatsDetails;

  PlayerStatsDetailsResponse? get playerStatsDetails => _playerStatsDetails;

  PlayerStatsModel(this.playerId);

  PlayerDetailsResponse? _playerDetails;

  PlayerDetailsResponse? get playerDetails => _playerDetails;

  Future<void> setupLocale(BuildContext context) async {
    final locale = Localizations.localeOf(context).toLanguageTag();
    // if (_locale == locale) return;
    // _locale = locale;
    _dateFormat = DateFormat.yMMMMd(locale);
    await loadStatsDetails();
    await loadDetails();
  }

  Future<void> loadStatsDetails() async {
    _playerStatsDetails = await _apiClient.playerStatsDetails(playerId);
    notifyListeners();
  }

  Future<void> loadDetails() async {
    _playerDetails = await _apiClient.playerDetails(playerId);
    notifyListeners();
  }
}
