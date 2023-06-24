import 'package:json_annotation/json_annotation.dart';
part 'vk_response_items_views.g.dart';

@JsonSerializable()
class Views {
  final int count;

  Views(this.count);
  factory Views.fromJson(Map<String, dynamic> json) => _$ViewsFromJson(json);

  Map<String, dynamic> toJson() => _$ViewsToJson(this);
}
