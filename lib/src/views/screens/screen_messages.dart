import 'package:flutter/material.dart';

import '../../constans.dart';
import '../components/sr_app_bar.dart';
import '../components/sr_bottom_navigaton_bar.dart';
import '../components/sr_drawer.dart';

class ScreenMessages extends StatelessWidget {
  static const String path = '/messages';
  const ScreenMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SRDrawer(),
      appBar: SRAppbar(
        title: Text(getMessageTitle, style: SRTextStyle.title),
      ),
      bottomNavigationBar: const SRBottomNavigationBar(currentIndex: 3),
    );
  }
}
