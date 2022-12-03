import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saferoom/src/views/screens/screen_home.dart';
import 'package:saferoom/src/views/screens/screen_sign_in.dart';
import 'package:saferoom/src/views/screens/screen_sign_up.dart';

abstract class SRRouter {
  const SRRouter._();

  static GoRouter build({
    required bool isSignedIn,
    List<GoRoute> routes = const [],
    String initialLocation = ScreenHome.path,
    String? Function(GoRouterState)? redirect,
    List<String> publicPaths = const [],
    List<String> loginPaths = const [],
  }) {
    return GoRouter(
      initialLocation: initialLocation,
      routes: <GoRoute>[
        ...routes,
      ],
      redirect: (_, state) {
        if (redirect != null) return redirect(state);
        bool isPublic = _publicPaths(publicPaths).any((e) => e == state.subloc);
        if (isPublic) return null;
        bool isLogin = _loginPaths(loginPaths).any((e) => e == state.subloc);
        if (!isSignedIn) return isLogin ? null : '/home';
        if (isSignedIn && isLogin) return '/';
        return null;
      },
      errorBuilder: (_, r) => const Scaffold(),
    );
  }

  static List<String> _loginPaths(List<String> loginPaths) {
    return [
      '/sign-in',
      '/sign-up',
      ...loginPaths,
    ];
  }

  static List<String> _publicPaths(List<String> publicPaths) {
    return [
      ...publicPaths,
    ];
  }
}

abstract class AppRoutes {
  const AppRoutes._();

  static final List<GoRoute> routes = <GoRoute>[
    GoRoute(
      path: ScreenHome.path,
      builder: (_, __) => const ScreenHome(),
    ),
    GoRoute(
      path: ScreenSignIn.path,
      builder: (_, __) => const ScreenSignIn(),
    ),
  ];

  static const List<String> loginPaths = [ScreenSignIn.path, ScreenSignUp.path];

  static const List<String> publicPaths = [];
}