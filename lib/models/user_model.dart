class UserModel {
  final String? uid;

  UserModel({
    required this.uid,
  });
}

class UserData {
  final String? uid;
  final int? faceitElo;
  final String? nickname;
  final String? playerid;
  final String? clientName;

  UserData(
      {this.uid,
      this.faceitElo,
      this.nickname,
      this.playerid,
      this.clientName});
}
