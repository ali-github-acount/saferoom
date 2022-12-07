import 'package:flutter/material.dart';

import '../../constans.dart';

class SRAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  const SRAppbar({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title ?? getAppName(size: 28),
      centerTitle: true,
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.lock_open))
      ],
      leading: GestureDetector(
        onTap: () {
          Scaffold.of(context).openDrawer();
        },
        child: Container(
            padding: const EdgeInsets.all(8), child: const CircleAvatar()),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
