import 'package:json_annotation/json_annotation.dart';

part 'player_rankings.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PlayerRankings {
  @JsonKey(fromJson: _parseCountry)
  final String? country;
  final int faceitElo;
  final int gameSkillLevel;
  @JsonKey(fromJson: _parseNickname)
  final String? nickname;
  final String playerId;
  final int position;

  PlayerRankings(
    this.country,
    this.faceitElo,
    this.gameSkillLevel,
    this.nickname,
    this.playerId,
    this.position,
  );

  factory PlayerRankings.fromJson(Map<String, dynamic> json) =>
      _$PlayerRankingsFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerRankingsToJson(this);

  static String? _parseNickname(String? nick) {
    if (nick == null || nick.isEmpty) return 'noNicknameFound';
    return nick;
  }

  static String? _parseCountry(String? contry) {
    if (contry == null || contry.isEmpty) return 'kz';
    return contry;
  }
}
