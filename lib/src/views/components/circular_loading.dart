import 'package:flutter/material.dart';

class SRCircularLaoding extends StatelessWidget {
  final Color? backgroundColor;
  const SRCircularLaoding({super.key, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    Color? backgroundColor =
        Theme.of(context).progressIndicatorTheme.refreshBackgroundColor;
    return CircularProgressIndicator.adaptive(
      backgroundColor: this.backgroundColor ?? backgroundColor,
    );
  }
}
