import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorting_hat/providers/answered_provider.dart';
import 'package:sorting_hat/ui/widgets/answered_widget.dart';
import 'package:sorting_hat/ui/widgets/main_layout.dart';
import 'package:sorting_hat/ui/widgets/score_widget.dart';
import 'package:sorting_hat/ui/widgets/search_field.dart';

class ListPage extends ConsumerWidget {
  static const String id = '/ListPage';

  const ListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(answeredProvider);
    final answeredList = provider.answered;
    return MainLayout(
      title: 'List Screen',
      currentScreenNo: 1,
      child: Column(
        children: [
          const ScoreWidget(),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: SearchField(),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: provider.chosenAnswer != null ? 1 : answeredList.length,
                shrinkWrap: true,
                itemBuilder: (context, ind) {
                  if (provider.chosenAnswer != null) {
                    return AnsweredWidget(model: provider.chosenAnswer!);
                  } else {
                    return AnsweredWidget(model: answeredList[ind]);
                  }
                }),
          )
        ],
      ),
    );
  }
}
