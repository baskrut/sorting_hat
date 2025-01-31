import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorting_hat/models/character_model.dart';
import 'package:sorting_hat/providers/all_caracters_provider.dart';
import 'package:sorting_hat/providers/answered_provider.dart';
import 'package:sorting_hat/ui/widgets/avatar_widget.dart';
import 'package:sorting_hat/ui/widgets/common_button.dart';
import 'package:sorting_hat/ui/widgets/main_layout.dart';
import 'package:sorting_hat/ui/widgets/score_widget.dart';

class HomePage extends ConsumerStatefulWidget {
  static const String id = '/';

  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final answers = ref.read(answeredProvider);

    return MainLayout(
      title: 'Home Screen',
      currentScreenNo: 0,
      child: Column(
        children: [
          const ScoreWidget(),
          ref.watch(allCharactersProvider).when(
                data: (data) {
                  dynamic hero = answers.editingAnswer ?? data;
                  return RefreshIndicator(
                    onRefresh: () {
                      answers.editingAnswer = null;
                      return ref.refresh(allCharactersProvider.future);
                    },
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Column(
                            children: [
                              AvatarWidget(url: hero.image ?? ''),
                              const SizedBox(
                                height: 12.0,
                              ),
                              Text(
                                hero.name ?? 'not specified',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: CommonButton(
                                label: 'Gryffindor',
                                iconPath: 'assets/icons/noun-gryffindor-crest-1704953.svg',
                                iconColor: Colors.red.shade800,
                                onTap: () async {
                                  if (answers.checkAndUpdate(character: hero, house: Houses.Gryffindor)) {
                                    return await ref.refresh(allCharactersProvider.future);
                                  }
                                },
                              ),
                            ),
                            const SizedBox(width: 12.0),
                            Flexible(
                              child: CommonButton(
                                label: 'Slytherin',
                                iconPath: 'assets/icons/noun-slytherin-crest-1704952.svg',
                                iconColor: Colors.green.shade900,
                                onTap: () async {
                                  if (answers.checkAndUpdate(character: hero, house: Houses.Slytherin)) {
                                    return await ref.refresh(allCharactersProvider.future);
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 12.0),
                        Row(
                          children: [
                            Flexible(
                              child: CommonButton(
                                label: 'Ravenclaw',
                                iconPath: 'assets/icons/noun-ravenclaw-crest-1704954.svg',
                                iconColor: Colors.indigo,
                                onTap: () async {
                                  if (answers.checkAndUpdate(character: hero, house: Houses.Ravenclaw)) {
                                    return await ref.refresh(allCharactersProvider.future);
                                  }
                                },
                              ),
                            ),
                            const SizedBox(width: 12.0),
                            Flexible(
                              child: CommonButton(
                                label: 'Hufflepuff',
                                iconPath: 'assets/icons/noun-hufflepuff-crest-1704951.svg',
                                iconColor: Colors.amber,
                                onTap: () async {
                                  if (answers.checkAndUpdate(character: hero, house: Houses.Hufflepuff)) {
                                    return await ref.refresh(allCharactersProvider.future);
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 12.0),
                        CommonButton(
                          label: 'Not in House',
                          onTap: () async {
                            if (answers.checkAndUpdate(character: hero, house: Houses.other)) {
                              return await ref.refresh(allCharactersProvider.future);
                            }
                          },
                        ),
                      ],
                    ),
                  );
                },
                error: (error, stackTrace) {
                  log('$error', stackTrace: stackTrace);
                  return Text('$error');
                },
                loading: () => const SizedBox(
                  height: 300,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
