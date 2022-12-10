import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:saferoom/src/api/auth_api.dart';
import 'package:saferoom/src/api/chat_api.dart';
import 'package:saferoom/src/models/entities/chat.dart';
import 'package:saferoom/src/models/entities/user.dart';

class FirebaseAuthApi implements AuthApi, ChatApi {
  static const String _collectionUsers = 'users';
  static const String _collectionChats = 'chats';
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  FirebaseAuthApi(
    FirebaseAuth auth,
    FirebaseFirestore firestore,
  )   : _auth = auth,
        _firestore = firestore;

  @override
  Stream<SRUser?> currentUser() {
    return _auth.authStateChanges().asyncMap((user) async {
      if (user == null) return null;
      try {
        var ref =
            await _firestore.collection(_collectionUsers).doc(user.uid).get();
        return SRUser.fromMap(ref.data());
      } catch (e) {
        throw 'failed fetching user';
      }
    });
  }

  @override
  Future<bool> signInWithEmail(SRUser user) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: user.email!,
        password: user.logPassword!,
      );
      return result.user != null;
    } catch (e) {
      throw 'failed signing in';
    }
  }

  @override
  Future<bool> signUpWithEmail(SRUser user) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.logPassword!,
      );
      if (result.user == null || result.user?.uid == null) return false;
      final newUser = user.copyWith(logPassword: '', uid: result.user!.uid);
      final ref = _firestore.collection(_collectionUsers).doc(newUser.uid);
      await ref.set(newUser.toMap());
      return result.user?.uid != null;
    } catch (e) {
      throw 'failed signing up';
    }
  }

  @override
  Future<bool> signOutUser() async {
    try {
      await _auth.signOut();
      return true;
    } catch (e) {
      throw 'failed signing out';
    }
  }

  @override
  Future<bool> recieve(Chat chat) async {
    try {
      final ch = chat.copyWith(recieverId: _auth.currentUser?.uid);
      final ref = _firestore.collection(_collectionChats).doc(ch.cId);
      await ref.set(ch.toMap());
      return true;
    } catch (e) {
      throw 'message not recieved';
    }
  }

  @override
  Future<bool> send(Chat chat) async {
    try {
      final ch = chat.copyWith(senderId: _auth.currentUser?.uid);
      final ref = _firestore.collection(_collectionChats).doc(ch.cId);
      await ref.set(ch.toMap());
      return true;
    } catch (e) {
      throw 'message not recieved';
    }
  }
}
