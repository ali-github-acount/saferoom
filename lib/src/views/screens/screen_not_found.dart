import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenNotFound extends StatelessWidget {
  static const String path = '/not-found';
  final String requestPath;
  final String? previousPage;

  const ScreenNotFound(this.requestPath, {super.key, this.previousPage});

  @override
  Widget build(BuildContext context) {
    final message = Column(
      children: [
        Text(
          tr("notFound.code"),
          style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        ),
        Text(
          "$requestPath ${tr("notFound.message")}",
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    );
    final backBtn = Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: () => context.go(previousPage ?? '/'),
          child: Text(tr("notFound.backBtn"))),
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
