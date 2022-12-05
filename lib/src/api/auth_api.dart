import 'package:saferoom/src/models/entities/user.dart';

abstract class AuthApi {
  Stream<SRUser?> currentUser();
  Future<bool> signUpWithEmail(SRUser user);
  Future<bool> signInWithEmail(SRUser user);
  Future<bool> signOutUser();
}
