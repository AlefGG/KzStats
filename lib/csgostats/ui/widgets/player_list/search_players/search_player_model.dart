import 'dart:async';

import 'package:csgostats/csgostats/domain/api_client/api_client_faceit.dart';
import 'package:csgostats/csgostats/domain/entity/search_player/search_player_items.dart';
import 'package:csgostats/csgostats/domain/entity/search_player/search_player_response.dart';
import 'package:csgostats/csgostats/ui/navigation/main_navigation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SearchPlayerModel extends ChangeNotifier {
  final _apiClient = ApiClientFaceit();
  final _searchedPlayers = <SearchPlayerItems>[];

  String _locale = '';
  var _isLoadingInProgress = false;
  late int? _currentPage;
  late int? _totalPage;
  String? _searchQuery = ' ';
  Timer? searchDeboubce;

  List<SearchPlayerItems> get players => List.unmodifiable(_searchedPlayers);
  late DateFormat _dateFormat;

  String stringFromDate(DateTime? date) =>
      date != null ? _dateFormat.format(date) : '';

  Future<void> setupLocale(BuildContext context) async {
    final locale = Localizations.localeOf(context).toLanguageTag();
    _locale = locale;
    _dateFormat = DateFormat.yMMMd(locale);
    await _resetList();
  }

  Future<void> _resetList() async {
    _currentPage = 0;
    _totalPage = 20;
    _searchedPlayers.clear();
    await _loadNextPage();
  }

  Future<SearchPlayerResponse> _loadSearchedPlayers(
      int? offset, int? limit) async {
    final query = _searchQuery;
    if (query == null) {
      return await _apiClient.searchPlayer(offset!, limit!, 'Aloha');
    } else {
      return await _apiClient.searchPlayer(offset!, limit!, query);
    }
  }

  Future<void> _loadNextPage() async {
    if (_isLoadingInProgress || _currentPage! > _totalPage!) return;
    _isLoadingInProgress = true;

    try {
      final searchedPlayersResponse =
          await _loadSearchedPlayers(_currentPage, _totalPage);
      _searchedPlayers.addAll(searchedPlayersResponse.items);
      _currentPage = searchedPlayersResponse.end;
      _totalPage = _currentPage! + 20;
      _isLoadingInProgress = false;
      notifyListeners();
    } catch (e) {
      _isLoadingInProgress = false;
    }
  }

  void onPlayerTap(BuildContext context, int index) {
    if (_searchedPlayers.isEmpty) {
      return;
    }
    final id = _searchedPlayers[index].playerId;
    Navigator.of(context)
        .pushNamed(MainNavigationRouteNames.playerStats, arguments: id);
  }

  Future<void> searchPlayer(String text) async {
    searchDeboubce?.cancel();
    searchDeboubce = Timer(const Duration(milliseconds: 100), () async {
      final searchQuery = text.isNotEmpty ? text : null;
      // if (_searchQuery == searchQuery) return;
      _searchQuery = searchQuery;
      await _resetList();
    });
  }

  void showedSearchedPlayerAtIndex(int index) {
    if (index < _searchedPlayers.length - 1) return;
    _loadNextPage();
  }
}
