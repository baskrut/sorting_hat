import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorting_hat/providers/answered_provider.dart';

class CommonAppbar extends ConsumerWidget implements PreferredSizeWidget {
  final String title;

  const CommonAppbar({required this.title, super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      elevation: 0.0,
      titleSpacing: 0.0,
      centerTitle: true,
      shape: const Border(bottom: BorderSide(color: Colors.black, width: 2)),
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            ref.read(answeredProvider).reset();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Reset',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        )
      ],
    );
  }
}
