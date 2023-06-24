import 'package:json_annotation/json_annotation.dart';

part 'player_details_infractions.g.dart';

@JsonSerializable()
class PlayerDetailsInfractions {
  final String? infractions;

  PlayerDetailsInfractions(this.infractions);

  factory PlayerDetailsInfractions.fromJson(Map<String, dynamic> json) =>
      _$PlayerDetailsInfractionsFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerDetailsInfractionsToJson(this);
}
