import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorting_hat/providers/answered_provider.dart';
import 'package:sorting_hat/ui/widgets/common_box.dart';

class ScoreWidget extends ConsumerWidget {
  const ScoreWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(answeredProvider);
    return Row(
      children: [
        Flexible(
          child: CommonBox(
            label: 'Total',
            header: Text(
              '${provider.total}',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Flexible(
          child: CommonBox(
            label: 'Success',
            header: Text(
              '${provider.success}',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Flexible(
          child: CommonBox(
            label: 'Failed',
            header: Text(
              '${provider.failed}',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }
}
