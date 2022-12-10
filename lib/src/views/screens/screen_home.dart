import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../components/sr_app_bar.dart';
import '../components/sr_bottom_navigaton_bar.dart';
import '../components/sr_drawer.dart';
import 'screen_profile_image.dart';

class ScreenHome extends StatelessWidget {
  static const String path = '/';
  ScreenHome({super.key});
  final _scafoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state.user.profile.profileImageURL == null) {
          return const ScreenProfileImage();
        }
        return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
            key: _scafoldKey,
            drawer: const SRDrawer(),
            bottomNavigationBar: const SRBottomNavigationBar(),
            appBar: const SRAppbar(),
            body: Container(
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(context.read<AuthBloc>().state.user.name ?? "hellp"),
                ],
              )),
            ));
      },
    );
  }
}
