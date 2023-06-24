import 'package:csgostats/csgostats/domain/entity/search_player/search_player_items.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_player_response.g.dart';

@JsonSerializable(explicitToJson: true)
class SearchPlayerResponse {
  final List<SearchPlayerItems> items;
  final int? start;
  final int? end;

  SearchPlayerResponse({
    required this.items,
    required this.start,
    required this.end,
  });

  factory SearchPlayerResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchPlayerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchPlayerResponseToJson(this);
}
