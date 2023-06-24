import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csgostats/models/client.dart';
import 'package:csgostats/models/team.dart';
import 'package:csgostats/models/user_model.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});
  //collections reference
  final CollectionReference playerCollection =
      FirebaseFirestore.instance.collection('players');
  final CollectionReference teamCollection =
      FirebaseFirestore.instance.collection('teams');

  Future updateUserData(String playerid, String nickname, int faceitElo,
      String clientid, String clientName) async {
    return await playerCollection.doc(uid).set({
      'playerid': playerid,
      'nickname': nickname,
      'faceitElo': faceitElo,
      'clientid': clientid,
      'clientName': clientName,
    });
  }

  //client list form snapsoht
  List<Client> _clientListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Client(
        clientid: doc.data().toString().contains('clientid')
            ? doc.get('clientid')
            : '',
        // clientid: doc.get('clientid') ?? '',
        faceitElo: doc.data().toString().contains('faceitElo')
            ? doc.get('faceitElo')
            : 0,
        // faceitElo: doc.get('faeceitElo') ?? 0,
        nickname: doc.data().toString().contains('nickname')
            ? doc.get('nickname')
            : '',
        playerid: doc.data().toString().contains('playerid')
            ? doc.get('playerid')
            : '',
        clientName: doc.data().toString().contains('clientName')
            ? doc.get('clientName')
            : '',
      );
    }).toList();
  }

  //team list from snapshot
  List<Team> _teamListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Team(
        logo: doc.data().toString().contains('logo') ? doc.get('logo') : '',
        name: doc.data().toString().contains('name') ? doc.get('name') : '',
        games: doc.data().toString().contains('Games') ? doc.get('Games') : '',
        maps: doc.data().toString().contains('Maps') ? doc.get('Maps') : '',
        points:
            doc.data().toString().contains('Points') ? doc.get('Points') : '',
        rounds:
            doc.data().toString().contains('Rounds') ? doc.get('Rounds') : '',

        // clientid: doc.get('clientid') ?? '',
      );
    }).toList();
  }

  //userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      faceitElo: snapshot['faceitElo'],
      nickname: snapshot['nickname'],
      playerid: snapshot['playerid'],
      clientName: snapshot['clientName'],
    );
  }

  //get team stream
  Stream<List<Team>> get team {
    return teamCollection.snapshots().map(_teamListFromSnapshot);
  }

  //get player stream
  Stream<List<Client>> get player {
    return playerCollection.snapshots().map(_clientListFromSnapshot);
  }

  //get user doc stream
  Stream<UserData> get userData {
    return playerCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }

  //delete document
  Future deleteDocument(String userId) async {
    try {
      return await FirebaseFirestore.instance
          .collection('players')
          .doc(userId)
          .delete();
    } catch (e) {
      return e.toString();
    }
  }
}
