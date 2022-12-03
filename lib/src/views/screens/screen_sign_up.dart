import 'package:flutter/material.dart';
import 'package:saferoom/src/views/forms/form_sign_up.dart';

class ScreenSignUp extends StatelessWidget {
  static const String path = '/sign-up';
  const ScreenSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: FormSignUp());
  }
}
