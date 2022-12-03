part of 'auth_bloc.dart';

class AuthState {
  final bool isLoading;
  final bool hasError;
  final String? error;
  final bool succeeded;
  final bool isSignedIn;
  final SRUser user;

  const AuthState({
    required this.isLoading,
    required this.hasError,
    required this.error,
    required this.succeeded,
    required this.isSignedIn,
    required this.user,
  });
  const AuthState.init({
    this.isLoading = false,
    this.hasError = false,
    this.error,
    this.succeeded = false,
    this.isSignedIn = false,
    this.user = const SRUser.init(),
  });
  AuthState copyWith({
    bool? isLoading,
    bool? hasError,
    String? error,
    bool? succeeded,
    bool? isSignedIn,
    SRUser? user,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      error: error ?? this.error,
      succeeded: succeeded ?? this.succeeded,
      isSignedIn: isSignedIn ?? this.isSignedIn,
      user: user ?? this.user,
    );
  }

  AuthState loadingState() {
    return AuthState(
      isLoading: true,
      hasError: false,
      error: null,
      succeeded: false,
      isSignedIn: isSignedIn,
      user: user,
    );
  }

  AuthState errorState(String? error) {
    return AuthState(
      isLoading: false,
      hasError: true,
      error: error ?? this.error,
      succeeded: false,
      isSignedIn: isSignedIn,
      user: user,
    );
  }

  AuthState successState({bool? isSignedIn, SRUser? user}) {
    return AuthState(
      isLoading: false,
      hasError: false,
      error: null,
      succeeded: true,
      isSignedIn: isSignedIn ?? this.isSignedIn,
      user: user ?? this.user,
    );
  }
}
