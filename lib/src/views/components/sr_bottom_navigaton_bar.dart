import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/screen_home.dart';
import '../screens/screen_messages.dart';
import '../screens/screen_notifications.dart';
import '../screens/screen_search.dart';

class SRBottomNavigationBar extends StatelessWidget {
  final int currentIndex;

  const SRBottomNavigationBar({Key? key, this.currentIndex = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> screens = [
      ScreenHome.path,
      ScreenSearch.path,
      ScreenNotifications.path,
      ScreenMessages.path,
    ];
    return BottomNavigationBar(
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        onTap: (value) {
          context.go(screens[value]);
        },
        currentIndex: currentIndex,
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
        ]);
  }
}
