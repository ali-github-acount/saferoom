import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saferoom/src/constans.dart';

class ScreenNotFound extends StatelessWidget {
  static const String path = '/not-found';
  final String requestPath;
  final String? previousPage;

  const ScreenNotFound(this.requestPath, {super.key, this.previousPage});

  @override
  Widget build(BuildContext context) {
    final message = Column(
      children: [
        Text(getError404, style: SRTextStyle.ultraV1),
        Text(
          "$requestPath $getErrorPageNotFound",
          style: SRTextStyle.sample,
        ),
      ],
    );
    final backBtn = Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () => context.go(previousPage ?? '/'),
        child: Text(getButtonBack),
      ),
    );
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [message, backBtn],
        ),
      ),
    );
  }
}
