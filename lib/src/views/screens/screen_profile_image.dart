import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saferoom/src/blocs/auth/auth_bloc.dart';

class ScreenProfileImage extends StatelessWidget {
  static const String path = '/profile-image';
  const ScreenProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        child: const Text("Skip"),
        onPressed: () {
          context.read<AuthBloc>().setProfileImageURL('');
        },
      )),
    );
  }
}
