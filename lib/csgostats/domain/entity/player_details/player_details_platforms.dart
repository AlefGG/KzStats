import 'package:json_annotation/json_annotation.dart';

part 'player_details_platforms.g.dart';

@JsonSerializable()
class PlayerDetailsPlatforms {
  final String? additionalProp1;
  final String? additionalProp2;
  final String? additionalProp3;

  PlayerDetailsPlatforms(
    this.additionalProp1,
    this.additionalProp2,
    this.additionalProp3,
  );

  factory PlayerDetailsPlatforms.fromJson(Map<String, dynamic> json) =>
      _$PlayerDetailsPlatformsFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerDetailsPlatformsToJson(this);
}
