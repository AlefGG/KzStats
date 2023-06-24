import 'package:csgostats/csgostats/domain/api_client/api_client_faceit.dart';
import 'package:csgostats/csgostats/domain/entity/player_rankings.dart';
import 'package:csgostats/csgostats/ui/navigation/main_navigation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PlayerListModel extends ChangeNotifier {
  final _apiClientFaceit = ApiClientFaceit();
  final _playerRankings = <PlayerRankings>[];
  List<PlayerRankings> get playerRankings => List.unmodifiable(_playerRankings);
  late DateFormat _dateFormat;
  String _locale = '';
  int _currentPage = 0;
  late int _totalPage;
  var _isLoadingInProgress = false;
  String? searchQuery;

  String stringFromDate(DateTime? date) =>
      date != null ? _dateFormat.format(date) : '';

  Future<void> setupLocale(BuildContext context) async {
    final locale = Localizations.localeOf(context).toLanguageTag();
    // if (_locale != locale) return;
    _locale = locale;
    _dateFormat = DateFormat.yMMMd(locale);
    await _resetList();
  }

  Future<void> _resetList() async {
    _currentPage = 0;
    _totalPage = 100;
    _playerRankings.clear();
    await _loadNextPage();
  }

  Future<void> _loadPlayers(int offset, int limit) async {
    final playerRankingsResponse =
        await _apiClientFaceit.playerList(_currentPage, _currentPage + 100);
    _playerRankings.addAll(playerRankingsResponse.playerRankings);
    _currentPage = playerRankingsResponse.end;
    _totalPage = _currentPage + 100;
    _isLoadingInProgress = false;
    notifyListeners();
  }

  Future<void> _loadNextPage() async {
    if (_isLoadingInProgress || _currentPage > _totalPage) return;
    _isLoadingInProgress = true;
    try {
      final playerRankingsResponse =
          await _apiClientFaceit.playerList(_currentPage, _currentPage + 100);
      _playerRankings.addAll(playerRankingsResponse.playerRankings);
      _currentPage = playerRankingsResponse.end;
      _totalPage = _currentPage + 100;
      _isLoadingInProgress = false;
      notifyListeners();
    } catch (e) {
      _isLoadingInProgress = false;
    }
  }

  void onPlayerTap(BuildContext context, int index) {
    final id = _playerRankings[index].playerId;
    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.playerStats,
      arguments: id,
    );
  }

  void showedPlayerAtIndex(int index) {
    if (index < _playerRankings.length - 1) return;
    _loadNextPage();
  }
}
