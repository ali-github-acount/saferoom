import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saferoom/src/views/screens/screen_sign_in.dart';

class ScreenStartApp extends StatelessWidget {
  static const String path = '/';
  const ScreenStartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TextButton(
              onPressed: () => context.go(ScreenSignIn.path),
              child: Text(tr('startApp.title')))),
    );
  }
}
