import 'package:flutter/material.dart';
import 'package:saferoom/src/constans.dart';

class SRSearchBar extends StatelessWidget {
  const SRSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        toolbarOptions: const ToolbarOptions(
            copy: true, cut: true, selectAll: true, paste: true),
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: getHintSearch,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
      ),
    );
  }
}
