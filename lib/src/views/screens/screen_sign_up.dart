import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saferoom/src/blocs/auth/auth_bloc.dart';
import 'package:saferoom/src/views/forms/form_sign_up.dart';

class ScreenSignUp extends StatelessWidget {
  static const String path = '/sign-up';
  const ScreenSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state.hasError) print(state.error);
        if (state.isLoading) {
          return const CircularProgressIndicator(value: 10);
        }
        return Scaffold(
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FormSignUp(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
