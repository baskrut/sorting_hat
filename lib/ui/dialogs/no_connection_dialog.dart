
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorting_hat/ui/widgets/common_button.dart';

class NoConnectionDialog extends ConsumerWidget {
  const NoConnectionDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Text(
              'No Connection',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 26.0),
            LayoutBuilder(builder: (context, constraints) {
              return SizedBox(
                width: constraints.maxWidth * 0.5,
                child: CommonButton(
                    label: 'OK',
                    onTap: () {
                      Navigator.of(context).pop();
                    }),
              );
            })
          ],
        ),
      ),
    );
  }

  static Route<Object?> noNoConnectionDialogBuilder(BuildContext context, [Object? arguments]) {
    return DialogRoute<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return const NoConnectionDialog();
      },
    );
  }
}