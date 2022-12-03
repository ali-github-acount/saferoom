import 'package:flutter/material.dart';
import 'package:saferoom/src/views/forms/form_sign_in.dart';

class ScreenSignIn extends StatelessWidget {
  static const String path = '/sign-in';
  const ScreenSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: FormSignIn());
  }
}
