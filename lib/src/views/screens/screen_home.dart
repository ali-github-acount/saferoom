import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saferoom/src/blocs/auth/auth_bloc.dart';

class ScreenHome extends StatelessWidget {
  static const String path = '/home';
  ScreenHome({super.key});
  final _scafoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scafoldKey,
        drawer: Drawer(
          child: ElevatedButton(
              onPressed: () {
                context.read<AuthBloc>().signOut();
              },
              child: const Text("logout")),
        ),
        bottomNavigationBar: BottomNavigationBar(
            landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: false,
            onTap: (value) {},
            items: const [
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: "Search",
                icon: Icon(Icons.search),
              ),
              BottomNavigationBarItem(
                label: "Notification",
                icon: Icon(Icons.notifications_none),
              ),
              BottomNavigationBarItem(
                label: "Message",
                icon: Icon(Icons.messenger_outlined),
              ),
            ]),
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.polyline_sharp))
          ],
          leading: GestureDetector(
            onTap: () {
              _scafoldKey.currentState?.openDrawer();
            },
            child: Container(
                padding: const EdgeInsets.all(10), child: const CircleAvatar()),
          ),
        ),
        body: Container(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(context.read<AuthBloc>().state.user.name ?? "hellp"),
            ],
          )),
        ));
  }
}
