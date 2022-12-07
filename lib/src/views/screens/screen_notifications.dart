import 'package:flutter/material.dart';

import '../../constans.dart';
import '../components/sr_app_bar.dart';
import '../components/sr_bottom_navigaton_bar.dart';
import '../components/sr_drawer.dart';

class ScreenNotifications extends StatelessWidget {
  static const String path = '/notifications';
  const ScreenNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SRDrawer(),
      bottomNavigationBar: const SRBottomNavigationBar(currentIndex: 2),
      appBar: SRAppbar(
        title: Text(getNotificationTitle, style: SRTextStyle.title),
      ),
    );
  }
}
