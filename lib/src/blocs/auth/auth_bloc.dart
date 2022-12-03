import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saferoom/src/models/entities/user.dart';
import 'package:saferoom/src/repositories/repo_auth.dart';

part 'auth_state.dart';

class AuthBloc extends Cubit<AuthState> {
  final AuthRepo _repo;
  AuthBloc(AuthRepo repo)
      : _repo = repo,
        super(const AuthState.init()) {
    fetchCurrentUser();
  }

  void setName(String? name) {
    emit(state.copyWith(user: state.user.copyWith(name: name)));
  }

  void setLastname(String? lastname) {
    emit(state.copyWith(user: state.user.copyWith(lastname: lastname)));
  }

  void setEmail(String? email) {
    emit(state.copyWith(user: state.user.copyWith(email: email)));
  }

  void setPassword(String? pass) {
    emit(state.copyWith(user: state.user.copyWith(logPassword: pass)));
  }

  void signin() async {
    emit(state.loadingState());
    try {
      final result = await _repo.signInWithEmailAndPassword(state.user);
      emit(state.successState(isSignedIn: result));
    } catch (e) {
      emit(state.errorState('$e'));
    }
  }

  void signup() async {
    try {
      emit(state.loadingState());
      final result = await _repo.signUpWithEmailAndPassword(state.user);
      emit(state.successState(isSignedIn: result));
    } catch (e) {
      emit(state.errorState('$e'));
    }
  }

  void signOut() async {
    await _repo.signOutUser();
  }

  StreamSubscription<SRUser?>? _isSignedInSub;
  void fetchCurrentUser() {
    _isSignedInSub?.cancel();
    _isSignedInSub = _repo.currentUser().listen((event) {
      if (event == null) {
        emit(state.successState(isSignedIn: false));
      } else {
        emit(state.successState(isSignedIn: true, user: event));
      }
    }, onError: (err) => emit(state.errorState('$err')));
  }

  @override
  Future<void> close() {
    _isSignedInSub?.cancel();
    return super.close();
  }
}
