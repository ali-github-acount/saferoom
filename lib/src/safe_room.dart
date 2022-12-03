import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saferoom/src/api/firebase_api.dart';
import 'package:saferoom/src/app_router.dart';
import 'package:saferoom/src/blocs/auth/auth_bloc.dart';
import 'package:saferoom/src/repositories/repo_auth.dart';

class SafeRoom extends StatelessWidget {
  const SafeRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeRoomProvider();
  }
}

class SafeRoomProvider extends StatelessWidget {
  const SafeRoomProvider({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final fs = FirebaseFirestore.instance;

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => AuthRepo(FireBaseApi(auth, fs)))
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(context.read<AuthRepo>()),
          )
        ],
        child: const SafeRoomApp(),
      ),
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
        );
      },
    );
  }
}
