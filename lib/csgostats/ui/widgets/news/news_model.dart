import 'package:csgostats/csgostats/domain/api_client/api_client_faceit.dart';
import 'package:csgostats/csgostats/domain/api_client/api_client_vk.dart';
import 'package:csgostats/csgostats/domain/entity/news/news_vk_response_items.dart';
import 'package:csgostats/csgostats/domain/entity/player_rankings.dart';
import 'package:csgostats/csgostats/ui/navigation/main_navigation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewsModel extends ChangeNotifier {
  final _apiClientVk = ApiClientVk();
  final _vkResponseItems = <VkResponseItems>[];
  List<VkResponseItems> get items => List.unmodifiable(_vkResponseItems);
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
    _totalPage = 10;
    _vkResponseItems.clear();
    await _loadNextPage();
  }

  Future<void> _loadNextPage() async {
    if (_isLoadingInProgress || _currentPage > _totalPage) return;
    _isLoadingInProgress = true;
    try {
      final itemsResponse =
          await _apiClientVk.newsList(_currentPage, _currentPage + 10);
      _vkResponseItems.addAll(itemsResponse.response.items);
      _currentPage += 10;
      _totalPage += 10;
      _isLoadingInProgress = false;
      notifyListeners();
    } catch (e) {
      _isLoadingInProgress = false;
    }
  }

  void showedNewsAtIndex(int index) {
    if (index < _vkResponseItems.length - 1) return;
    _loadNextPage();
  }
}
