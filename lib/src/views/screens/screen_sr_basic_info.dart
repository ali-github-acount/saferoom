import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saferoom/src/views/components/card_message.dart';

import '../../api/local_db.dart';
import 'screen_sr_auth.dart';

class ScreenSRBasicInfo extends StatelessWidget {
  static const String path = '/basic-info';
  const ScreenSRBasicInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PageController();

    return Scaffold(
      body: PageView(controller: controller, children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: CardMessage(
              onPositive: () => controller.nextPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeIn),
              image: const AssetImage('images/welcom.png'),
              message:
                  "Ho wellcom com tovery happy becus of youHeelo wellcom to my app to day iam very happy becus of youHeelo wellcom to my app to day iam very happy becus of youHeelo wellcom to my app to day iam very happy becus of you"),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: CardMessage(
              onPositive: () => controller.nextPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeIn),
              onNegative: () => controller.previousPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOut),
              image: const AssetImage('images/security.png'),
              message:
                  "Ho wellcom com tovery happy becus of youHeelo wellcom to my app to day iam very happy becus of youHeelo wellcom to my app to day iam very happy becus of youHeelo wellcom to my app to day iam very happy becus of you"),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: CardMessage(
              positveLabel: "Start App",
              onPositive: () {
                LocalDb.setIsInfoSeen(true);
                context.go(ScreenSRAuth.path);
              },
              onNegative: () => controller.previousPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOut),
              image: const AssetImage('images/start.png'),
              message:
                  "Ho wellcom com tovery happy becus of youHeelo wellcom to my app to day iam very happy becus of youHeelo wellcom to my app to day iam very happy becus of youHeelo wellcom to my app to day iam very happy becus of you"),
        ),
      ]),
    );
  }
}
