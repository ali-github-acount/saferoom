import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saferoom/src/blocs/auth/auth_bloc.dart';

class ScreenHome extends StatelessWidget {
  static const String path = '/home';
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(child: Text(context.read<AuthBloc>().state.user.name!)),
    ));
  }
}
