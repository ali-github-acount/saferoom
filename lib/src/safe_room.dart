import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saferoom/src/api/firebase_auth_api.dart';
import 'package:saferoom/src/app_router.dart';
import 'package:saferoom/src/blocs/auth/auth_bloc.dart';
import 'package:saferoom/src/repositories/repo_auth.dart';
import 'package:saferoom/src/supported_languages.dart';

class SafeRoom {
  static void init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => EasyLocalization(
        supportedLocales: SupportedLanguage.getLanguages,
        path: 'languages',
        child: const SafeRoomRepositoriesProvider(),
      ),
    ));
  }
}

class SafeRoomRepositoriesProvider extends StatelessWidget {
  const SafeRoomRepositoriesProvider({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final fs = FirebaseFirestore.instance;

    return MultiRepositoryProvider(providers: [
      RepositoryProvider(create: (_) => AuthRepo(FirebaseAuthApi(auth, fs)))
    ], child: const SafeRoomBlocsProvider());
  }
}

class SafeRoomBlocsProvider extends StatelessWidget {
  const SafeRoomBlocsProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(context.read<AuthRepo>()),
        )
      ],
      child: const SafeRoomApp(),
    );
  }
}

class SafeRoomApp extends StatelessWidget {
  const SafeRoomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final router = SRRouter.build(
          isSignedIn: state.isSignedIn,
          routes: AppRoutes.routes,
          publicPaths: AppRoutes.publicPaths,
          loginPaths: AppRoutes.loginPaths,
        );

        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          showPerformanceOverlay: false,
          showSemanticsDebugger: false,
          debugShowMaterialGrid: false,
          checkerboardOffscreenLayers: false,
          routeInformationProvider: router.routeInformationProvider,
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          useInheritedMediaQuery: true,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        );
      },
    );
  }
}
