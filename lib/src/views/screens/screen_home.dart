import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saferoom/src/views/screens/screen_sign_in.dart';

class ScreenHome extends StatelessWidget {
  static const String path = '/home';
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TextButton(
              onPressed: () => context.go(ScreenSignIn.path),
              child: const Text("sign in"))),
    );
  }
}
