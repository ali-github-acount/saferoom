import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saferoom/src/blocs/auth/auth_bloc.dart';
import 'package:saferoom/src/views/forms/form_sign_up.dart';

import '../../constans.dart';

class ScreenCreateAcount extends StatelessWidget {
  static const String path = '/create-acount';
  const ScreenCreateAcount({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const CircularProgressIndicator(value: 10);
        }
        return Scaffold(
          body: SafeArea(
            child: SizedBox(
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(30),
                      child: getAppName(size: 50)),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Join and Make safeRoom and make Your sessions",
                      style: SRTextStyle.title,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  FormSignUp(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
