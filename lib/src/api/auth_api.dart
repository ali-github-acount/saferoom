import 'package:saferoom/src/models/entities/user.dart';

abstract class AuthApi {
  Stream<SRUser?> currentUser();
  Future<bool> signUpWithEmailAndPassword(SRUser user);
  Future<bool> signInWithEmailAndPassword(SRUser user);
  Future<bool> signOutUser();
}
