// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_player_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchPlayerResponse _$SearchPlayerResponseFromJson(
        Map<String, dynamic> json) =>
    SearchPlayerResponse(
      items: (json['items'] as List<dynamic>)
          .map((e) => SearchPlayerItems.fromJson(e as Map<String, dynamic>))
          .toList(),
      start: json['start'] as int?,
      end: json['end'] as int?,
    );

Map<String, dynamic> _$SearchPlayerResponseToJson(
        SearchPlayerResponse instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'start': instance.start,
      'end': instance.end,
    };
