import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:saferoom/src/constans.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../forms/form_sign_in.dart';

class ScreenSRAuth extends StatelessWidget {
  static const String path = '/authentication';
  const ScreenSRAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const CircularProgressIndicator(value: 10);
        }
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(30),
                      child: getAppName(size: 50)),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.maxFinite, 55),
                          backgroundColor: Colors.orangeAccent),
                      onPressed: () {},
                      label: const Text("Continu With Google"),
                      icon: const Icon(AntDesign.google),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.maxFinite, 55),
                      ),
                      onPressed: () {},
                      label: const Text("Continu With Twitter"),
                      icon: const Icon(AntDesign.twitter),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text("Or"),
                  ),
                  FormSignIn(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
