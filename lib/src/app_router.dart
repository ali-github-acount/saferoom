import 'package:go_router/go_router.dart';
import 'package:saferoom/src/api/local_db.dart';
import 'package:saferoom/src/views/screens/screen_create_acount.dart';
import 'package:saferoom/src/views/screens/screen_create_message.dart';
import 'package:saferoom/src/views/screens/screen_home.dart';
import 'package:saferoom/src/views/screens/screen_messages.dart';
import 'package:saferoom/src/views/screens/screen_not_found.dart';
import 'package:saferoom/src/views/screens/screen_notifications.dart';
import 'package:saferoom/src/views/screens/screen_search.dart';
import 'package:saferoom/src/views/screens/screen_sr_auth.dart';
import 'package:saferoom/src/views/screens/screen_sr_basic_info.dart';

abstract class SRRouter {
  const SRRouter._();

  static GoRouter build({
    required bool isSignedIn,
    List<GoRoute> routes = const [],
    String initialLocation = '/',
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
            previousPage: isSignedIn ? '/' : '/basic-info',
          ),
        ),
        ...routes,
      ],
      redirect: (_, state) {
        if (redirect != null) return redirect(state);
        bool isPublic = _publicPaths(publicPaths).any((e) => e == state.subloc);
        if (isPublic) return null;
        bool isLogin = _loginPaths(loginPaths).any((e) => e == state.subloc);
        if (!isSignedIn) return isLogin ? null : '/basic-info';

        if (isSignedIn && isLogin) return '/';
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
  AppRoutes._();

  static final List<GoRoute> routes = <GoRoute>[
    GoRoute(
      path: ScreenHome.path,
      builder: (_, __) => ScreenHome(),
    ),
    GoRoute(
      path: ScreenSRBasicInfo.path,
      builder: (_, __) => const ScreenSRBasicInfo(),
      redirect: (_, __) async {
        bool isSeenInfo = await LocalDb.getIsInfoSeen();
        if (isSeenInfo) return '/authentication';
        return '/basic-info';
      },
    ),
    GoRoute(
      path: ScreenSRAuth.path,
      builder: (_, __) => const ScreenSRAuth(),
    ),
    GoRoute(
      path: ScreenCreateAcount.path,
      builder: (_, __) => const ScreenCreateAcount(),
    ),
    GoRoute(
      path: ScreenSearch.path,
      builder: (_, __) => const ScreenSearch(),
    ),
    GoRoute(
      path: ScreenNotifications.path,
      builder: (_, __) => const ScreenNotifications(),
    ),
    GoRoute(
      path: ScreenMessages.path,
      builder: (_, __) => const ScreenMessages(),
    ),
    GoRoute(
      path: ScreenCreateMessage.path,
      builder: (_, __) => const ScreenCreateMessage(),
    ),
  ];

  static const List<String> loginPaths = [
    ScreenSRBasicInfo.path,
    ScreenSRAuth.path,
    ScreenCreateAcount.path,
  ];

  static const List<String> publicPaths = [];
}
