import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RortyAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  const RortyAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class RortyAppBarWithBack extends StatelessWidget with PreferredSizeWidget {
  final String title;

  const RortyAppBarWithBack({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
