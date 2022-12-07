import 'package:flutter/material.dart';
import 'package:saferoom/src/views/components/sr_app_bar.dart';
import 'package:saferoom/src/views/components/sr_search_bar.dart';

import '../components/sr_bottom_navigaton_bar.dart';
import '../components/sr_drawer.dart';

class ScreenSearch extends StatelessWidget {
  static const String path = '/search';
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: SRDrawer(),
      bottomNavigationBar: SRBottomNavigationBar(currentIndex: 1),
      appBar: SRAppbar(
        title: SRSearchBar(),
      ),
    );
  }
}
