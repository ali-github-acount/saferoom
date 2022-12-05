import 'package:go_router/go_router.dart';
import 'package:saferoom/src/views/screens/screen_home.dart';
import 'package:saferoom/src/views/screens/screen_not_found.dart';
import 'package:saferoom/src/views/screens/screen_sign_in.dart';
import 'package:saferoom/src/views/screens/screen_sign_up.dart';
import 'package:saferoom/src/views/screens/screen_start_app.dart';

abstract class SRRouter {
  const SRRouter._();

  static GoRouter build({
    required bool isSignedIn,
    List<GoRoute> routes = const [],
    String initialLocation = '/home',
    String? Function(GoRouterState)? redirect,
    List<String> publicPaths = const [],
    List<String> loginPaths = const [],
  }) {
    return GoRouter(
      initialLocation: initialLocation,
      routes: <GoRoute>[
        GoRoute(
          path: ScreenNotFound.path,
          builder: (_, r) => ScreenNotFound(
            r.location,
            previousPage: isSignedIn ? '/home' : '/',
          ),
        ),
        ...routes,
      ],
      redirect: (_, state) {
        if (redirect != null) return redirect(state);
        bool isPublic = _publicPaths(publicPaths).any((e) => e == state.subloc);
        if (isPublic) return null;
        bool isLogin = _loginPaths(loginPaths).any((e) => e == state.subloc);
        if (!isSignedIn) return isLogin ? null : '/';

        if (isSignedIn && isLogin) return '/home';
        return null;
      },
      errorBuilder: (_, r) => ScreenNotFound(r.location),
    );
  }

  static List<String> _loginPaths(List<String> loginPaths) {
    return [
      ...loginPaths,
    ];
  }

  static List<String> _publicPaths(List<String> publicPaths) {
    return [
      ScreenNotFound.path,
      ...publicPaths,
    ];
  }
}

abstract class AppRoutes {
  const AppRoutes._();

  static final List<GoRoute> routes = <GoRoute>[
    GoRoute(
      path: ScreenHome.path,
      builder: (_, __) => ScreenHome(),
    ),
    GoRoute(
      path: ScreenStartApp.path,
      builder: (_, __) => const ScreenStartApp(),
    ),
    GoRoute(
      path: ScreenSignIn.path,
      builder: (_, __) => const ScreenSignIn(),
    ),
    GoRoute(
      path: ScreenSignUp.path,
      builder: (_, __) => const ScreenSignUp(),
    ),
  ];

  static const List<String> loginPaths = [
    ScreenStartApp.path,
    ScreenSignIn.path,
    ScreenSignUp.path,
  ];

  static const List<String> publicPaths = [];
}
