import 'package:advanced_search/advanced_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorting_hat/providers/answered_provider.dart';

class SearchField extends ConsumerWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AdvancedSearch(
      searchItems: ref.watch(answeredProvider).searchableAnswers,
      hintText: 'Filter characters',
      hintTextColor: Colors.black,
      borderColor: Colors.black,
      maxElementsToDisplay: 5,
      itemsShownAtStart: 0,
      onItemTap: (int index, String value) {
        FocusScope.of(context).unfocus();
        ref.read(answeredProvider).setChoice(index);
      },
      onSearchClear: () {
        ref.read(answeredProvider).setChoice(null);
      },
    );
  }
}
