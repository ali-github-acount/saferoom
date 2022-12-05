import 'package:saferoom/src/api/auth_api.dart';
import 'package:saferoom/src/models/entities/user.dart';

class AuthRepo {
  final AuthApi _authApi;

  AuthRepo(AuthApi authApi) : _authApi = authApi;

  Stream<SRUser?> currentUser() {
    return _authApi.currentUser();
  }

  Future<bool> signUpWithEmail(SRUser user) {
    return _authApi.signUpWithEmail(user);
  }

  Future<bool> signInWithEmail(SRUser user) {
    return _authApi.signInWithEmail(user);
  }

  Future<bool> signOutUser() {
    return _authApi.signOutUser();
  }
}
