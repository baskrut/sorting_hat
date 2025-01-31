import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorting_hat/models/answered_model.dart';
import 'package:sorting_hat/providers/answered_provider.dart';
import 'package:sorting_hat/ui/pages/details_page.dart';
import 'package:sorting_hat/ui/pages/home_page.dart';
import 'package:sorting_hat/ui/widgets/avatar_widget.dart';

class AnsweredWidget extends ConsumerWidget {
  final AnsweredModel model;

  const AnsweredWidget({required this.model, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(DetailsPage.id, arguments: model);
      },
      child: ListTile(
        leading: AvatarWidget(
          url: model.image ?? '',
          size: 60.0,
        ),
        title: Text(model.name ?? 'not specified'),
        subtitle: Text('Attempts: ${model.attempts}'),
        trailing: model.isSuccess
            ? const Icon(
                Icons.check_circle,
                color: Colors.green,
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                      onTap: () {
                        ref.read(answeredProvider).editingAnswer = model;
                        Navigator.of(context).pushReplacementNamed(HomePage.id);
                      },
                      child: const Icon(Icons.refresh)),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.cancel_outlined,
                    color: Colors.red,
                  )
                ],
              ),
      ),
    );
  }
}
