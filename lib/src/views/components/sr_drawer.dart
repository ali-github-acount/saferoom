import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/auth_bloc.dart';

class SRDrawer extends StatelessWidget {
  const SRDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ElevatedButton(
          onPressed: () {
            context.read<AuthBloc>().signOut();
          },
          child: const Text("logout")),
    );
  }
}
