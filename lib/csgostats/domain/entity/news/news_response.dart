import 'package:csgostats/csgostats/domain/entity/news/news_vk_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_response.g.dart';

@JsonSerializable(explicitToJson: true)
class NewsResponse {
  final VkResponse response;

  NewsResponse(this.response);
  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NewsResponseToJson(this);
}
