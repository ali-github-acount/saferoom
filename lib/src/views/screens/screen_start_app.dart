import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saferoom/src/views/screens/screen_sign_in.dart';

class ScreenStartApp extends StatelessWidget {
  static const String path = '/';
  const ScreenStartApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      Container(
        color: Colors.amber,
        child: const Center(child: Text("page 1")),
      ),
      Container(
        color: Colors.black,
        child: const Center(child: Text("page 2")),
      ),
      Container(
        child: Center(
            child: ElevatedButton(
          child: const Text("sign In"),
          onPressed: () => context.go(ScreenSignIn.path),
        )),
      ),
    ];
    return Scaffold(
      body: PageView.builder(
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return pages[index];
        },
      ),
    );
  }
}
