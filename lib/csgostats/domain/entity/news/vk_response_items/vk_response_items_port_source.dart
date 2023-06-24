import 'package:json_annotation/json_annotation.dart';
part 'vk_response_items_port_source.g.dart';

@JsonSerializable()
class PostSource {
  final String type;

  PostSource(this.type);
  factory PostSource.fromJson(Map<String, dynamic> json) =>
      _$PostSourceFromJson(json);

  Map<String, dynamic> toJson() => _$PostSourceToJson(this);
}
