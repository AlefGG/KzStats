import 'package:json_annotation/json_annotation.dart';
part 'vk_response_items_is_donut.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class IsDonut {
  final bool isDonut;

  IsDonut(this.isDonut);
  factory IsDonut.fromJson(Map<String, dynamic> json) =>
      _$IsDonutFromJson(json);

  Map<String, dynamic> toJson() => _$IsDonutToJson(this);
}
