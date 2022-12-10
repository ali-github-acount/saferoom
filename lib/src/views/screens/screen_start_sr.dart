import 'package:flutter/material.dart';
import 'package:saferoom/src/constans.dart';
import 'package:saferoom/src/views/components/circular_loading.dart';

class ScreenStartSR extends StatelessWidget {
  const ScreenStartSR({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 100,
        child: Column(
          children: [
            getAppNameV2(),
            Text(getSRVersion, style: theme.textTheme.caption)
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SRCircularLaoding(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: getAppName(),
            ),
          ],
        ),
      ),
    );
  }
}
