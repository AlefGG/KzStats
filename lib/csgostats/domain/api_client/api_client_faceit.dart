// import 'dart:convert';
// import 'dart:io';

// import 'package:csgostats/domain/entity/player_rankings_response.dart';

// enum ApiClientExceptionType { Network, Auth, Other }

// class ApiClientException implements Exception {
//   final ApiClientExceptionType type;

//   ApiClientException(this.type);
// }

// class ApiClientFaceit {
//   final _client = HttpClient();
//   static const _host = 'https://open.faceit.com/data/v4';
//   static const _apiKey = 'ac9243e9-9e3d-4bcd-bb6e-e768d242513b';

//   Uri _makeUri(String path, [Map<String, dynamic>? parameters]) {
//     final uri = Uri.parse('$_host$path');
//     if (parameters != null) {
//       return uri.replace(queryParameters: parameters);
//     } else {
//       return uri;
//     }
//   }

//   Future<T> _get<T>(
//     String path,
//     T Function(dynamic json) parser, [
//     Map<String, dynamic>? parameters,
//   ]) async {
//     final url = _makeUri(path, parameters);
//     try {
//       final request = await _client.getUrl(url);
//       final response = await request.close();
//       final dynamic json = (await response.jsonDecode());
//       _validateResponse(response, json);

//       final result = parser(json);
//       return result;
//     } on SocketException {
//       throw ApiClientException(ApiClientExceptionType.Network);
//     } on ApiClientException {
//       rethrow;
//     } catch (_) {
//       throw ApiClientException(ApiClientExceptionType.Other);
//     }
//   }

//   Future<PlayerRankingsResponse> playerList(int offset, int limit) async {
//     parser(dynamic json) {
//       final jsonMap = json as Map<String, dynamic>;
//       final response = PlayerRankingsResponse.fromJson(jsonMap);
//       return response;
//     }

//     final result = _get(
//       '/rankings/games/csgo/regions/EU?country=kz',
//       parser,
//       <String, dynamic>{
//         'api_key': _apiKey,
//         'offset': offset.toString(),
//         'limit': limit.toString(),
//       },
//     );
//     return result;
//   }

//   void _validateResponse(HttpClientResponse response, dynamic json) {
//     if (response.statusCode == 401) {
//       final status = json['status_code'];
//       final code = status is int ? status : 0;
//       if (code == 30) {
//         throw ApiClientException(ApiClientExceptionType.Auth);
//       } else {
//         throw ApiClientException(ApiClientExceptionType.Other);
//       }
//     }
//   }
// }

// extension HttpClientResponseJsonDecode on HttpClientResponse {
//   Future<dynamic> jsonDecode() async {
//     return transform(utf8.decoder)
//         .toList()
//         .then((value) => value.join())
//         .then<dynamic>((v) => json.decode(v));
//   }
// }

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:csgostats/csgostats/domain/entity/player_details/player_details_response.dart';
import 'package:csgostats/csgostats/domain/entity/player_stats_details_response.dart';
import 'package:csgostats/csgostats/domain/entity/player_rankings_response.dart';
import 'package:csgostats/csgostats/domain/entity/search_player/search_player_response.dart';
import 'package:http/http.dart' as http;

class ApiClientFaceit {
  static const _imageUrl =
      'https://storage.googleapis.com/distribution.faceit.com/images';

  Future<PlayerRankingsResponse> playerList(int offset, int limit) async {
    final queryParameters = {
      'country': 'kz',
      'offset': '$offset',
      'limit': '$limit',
    };
    final uri = Uri.https('open.faceit.com',
        '/data/v4/rankings/games/csgo/regions/EU', queryParameters);
    final response = await http.get(
      uri,
      headers: {
        'accept': 'application/json',
        'Authorization': 'Bearer 912b7fb0-7af3-4e53-96c9-f0c7ad6d6052',
      },
    );
    final responseJson = jsonDecode(response.body);
    final result = PlayerRankingsResponse.fromJson(responseJson);
    return result;
  }

  Future<SearchPlayerResponse> searchPlayer(
      int offset, int limit, String nickname) async {
    final queryParameters = {
      'nickname': nickname,
      'country': 'kz',
      'offset': '$offset',
      'limit': '$limit',
    };
    final uri = Uri.https(
        'open.faceit.com', '/data/v4/search/players', queryParameters);
    final response = await http.get(
      uri,
      headers: {
        'accept': 'application/json',
        'Authorization': 'Bearer 912b7fb0-7af3-4e53-96c9-f0c7ad6d6052',
      },
    );
    final responseJson = jsonDecode(response.body);
    final result = SearchPlayerResponse.fromJson(responseJson);
    return result;
  }

  Future<PlayerStatsDetailsResponse> playerStatsDetails(String playerId) async {
    final uri =
        Uri.https('open.faceit.com', '/data/v4/players/$playerId/stats/csgo');
    final response = await http.get(
      uri,
      headers: {
        'accept': 'application/json',
        'Authorization': 'Bearer 912b7fb0-7af3-4e53-96c9-f0c7ad6d6052',
      },
    );
    final responseJson = jsonDecode(response.body);
    final result = PlayerStatsDetailsResponse.fromJson(responseJson);
    return result;
  }

  Future<PlayerDetailsResponse> playerDetails(String playerId) async {
    final uri = Uri.https('open.faceit.com', '/data/v4/players/$playerId');
    final response = await http.get(
      uri,
      headers: {
        'accept': 'application/json',
        'Authorization': 'Bearer 912b7fb0-7af3-4e53-96c9-f0c7ad6d6052',
      },
    );
    final responseJson = jsonDecode(response.body);
    final result = PlayerDetailsResponse.fromJson(responseJson);
    return result;
  }

  Future<PlayerDetailsResponse> playerDetailsByNickname(String nickname) async {
    final uri = Uri.https('open.faceit.com', '/data/v4/players/$nickname');
    final response = await http.get(
      uri,
      headers: {
        'accept': 'application/json',
        'Authorization': 'Bearer 912b7fb0-7af3-4e53-96c9-f0c7ad6d6052',
      },
    );
    final responseJson = jsonDecode(response.body);
    final result = PlayerDetailsResponse.fromJson(responseJson);
    return result;
  }
}
