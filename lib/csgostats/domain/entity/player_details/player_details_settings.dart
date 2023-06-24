import 'package:json_annotation/json_annotation.dart';

part 'player_details_settings.g.dart';

@JsonSerializable()
class PlayerDetailsSettings {
  final String? language;

  PlayerDetailsSettings(this.language);

  factory PlayerDetailsSettings.fromJson(Map<String, dynamic> json) =>
      _$PlayerDetailsSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerDetailsSettingsToJson(this);
}
