import 'package:csgostats/csgostats/domain/entity/news/news_vk_response_items.dart';
import 'package:json_annotation/json_annotation.dart';
part 'news_vk_response.g.dart';

@JsonSerializable(explicitToJson: true)
class VkResponse {
  final int count;
  final List<VkResponseItems> items;

  VkResponse(this.count, this.items);
  factory VkResponse.fromJson(Map<String, dynamic> json) =>
      _$VkResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VkResponseToJson(this);
}
