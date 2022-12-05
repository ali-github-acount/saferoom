import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:saferoom/src/api/auth_api.dart';
import 'package:saferoom/src/models/entities/user.dart';

class FirebaseAuthApi implements AuthApi {
  static const String _collection = 'users';
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
        var ref = await _firestore.collection(_collection).doc(user.uid).get();
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
      final ref = _firestore.collection(_collection).doc(newUser.uid);
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
}
