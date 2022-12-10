import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:saferoom/src/views/screens/screen_create_message.dart';

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
        action: IconButton(
            onPressed: () {
              context.push(ScreenCreateMessage.path);
            },
            icon: const Icon(Entypo.new_message)),
      ),
      bottomNavigationBar: const SRBottomNavigationBar(currentIndex: 3),
    );
  }
}
