import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorting_hat/models/character_model.dart';
import 'package:sorting_hat/services/base_api_service.dart';
import 'package:sorting_hat/services/character_service.dart';

final allCharactersProvider = FutureProvider.autoDispose<CharacterModel>((ref) async {
  final CharacterService characterService = CharacterService(ApiRequester.instance);

  return await characterService.fetchAllCharacters().then((list) {
    return list[Random().nextInt(list.length - 1)];
  });
});
