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
      child: Column(
        children: [
          const DrawerHeader(
            child: CircleAvatar(
              radius: 120,
            ),

            //     child: Column(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     const CircleAvatar(),
            //     Text(context.read<AuthBloc>().state.user.name!)
            //   ],
            // )
          ),
          const Text("User name"),
          ElevatedButton(
              onPressed: () {
                context.read<AuthBloc>().signOut();
              },
              child: const Text("logout")),
        ],
      ),
    );
  }
}
