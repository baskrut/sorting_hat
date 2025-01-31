import 'package:flutter/material.dart';

class CommonBox extends StatelessWidget {
  final Widget? header;
  final String label;
  final Color color;

  const CommonBox({
    required this.label,
    this.header,
    this.color = Colors.white,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(width: 2.0, color: Colors.black),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            header ?? const SizedBox(),
            Text(
              label,
              style: header == null
                  ? Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700, height: 3)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
