import 'dart:async';
import 'dart:convert';

import 'package:csgostats/csgostats/domain/entity/news/news_response.dart';

import 'package:http/http.dart' as http;

class ApiClientVk {
  static const _imageUrl =
      'https://storage.googleapis.com/distribution.faceit.com/images';

  Future<NewsResponse> newsList(int offset, int count) async {
    final queryParameters = {
      'v': '5.131',
      'access_token':
          'aab21d8baab21d8baab21d8bada9a610cfaaab2aab21d8bced3dc7406d82cd9f7a3351a',
      'domain': 'qcplkz',
      'offset': '$offset',
      'count': '$count',
    };
    final uri = Uri.https('api.vk.com', '/method/wall.get', queryParameters);
    final response = await http.get(uri);
    final responseJson = jsonDecode(response.body);
    final result = NewsResponse.fromJson(responseJson);
    return result;
  }
}
