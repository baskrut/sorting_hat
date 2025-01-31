import 'dart:developer';

import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  final String url;
  final double size;

  const AvatarWidget({required this.url, this.size = 120.0, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (size * 1.5),
      width: size,
      child: url.isEmpty
          ? AvatarPlaceholder(size: size)
          : Image.network(
              url,
              errorBuilder: (context, error, stackTrace) {
                log('$error');
                return AvatarPlaceholder(size: size);
              },
            ),
    );
  }
}

class AvatarPlaceholder extends StatelessWidget {
  final double size;

  const AvatarPlaceholder({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.black)),
        child: Icon(
          Icons.person_outlined,
          size: size,
        ));
  }
}
