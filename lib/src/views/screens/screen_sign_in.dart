import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saferoom/src/blocs/auth/auth_bloc.dart';

import '../forms/form_sign_in.dart';

class ScreenSignIn extends StatelessWidget {
  static const String path = '/sign-in';
  const ScreenSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const CircularProgressIndicator(value: 10);
        }
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                FormSignIn(),
              ],
            ),
          ),
        );
      },
    );
  }
}
