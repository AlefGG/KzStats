import 'package:csgostats/authenticate/sign_in.dart';
import 'package:csgostats/models/user_model.dart';
import 'package:csgostats/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create userModel based on firebase user
  UserModel? _userFromFirebaseUser(User? user) {
    return user != null
        ? UserModel(
            uid: user.uid,
          )
        : null;
  }

  // auth change user stream
  Stream<UserModel?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  //sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      //create a new document for the user with the uid
      await DatabaseService(uid: user!.uid)
          .updateUserData('playerid', 'nickname', 0, user.uid, 'clientName');
      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future deleteAccount(String email, String password) async {
    try {
      User? user = _auth.currentUser;
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);
      await FirebaseAuth.instance.currentUser!
          .reauthenticateWithCredential(credential);

      return await user!.delete();
    } catch (e) {
      return e.toString();
    }
  }

  //set a user's email address
  Future sendPasswordResetEmail(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return e.toString();
    }
  }
}

//get users id
String? getUserId() {
  try {
    var userId = FirebaseAuth.instance.currentUser?.uid;
    return userId;
  } catch (e) {
    return e.toString();
  }
}

String? getUserEmail() {
  try {
    var userEmail = FirebaseAuth.instance.currentUser?.email;
    return userEmail;
  } catch (e) {
    return e.toString();
  }
}
