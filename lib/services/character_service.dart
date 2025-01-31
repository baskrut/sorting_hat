import 'dart:convert';

import 'package:sorting_hat/constants.dart';
import 'package:sorting_hat/models/character_model.dart';
import 'package:sorting_hat/services/base_api_service.dart';

class CharacterService {
  final ApiRequester _apiRequester;

  CharacterService(this._apiRequester);

  Future<List<CharacterModel>> fetchAllCharacters() async {
    return await _apiRequester
        .handleRequest(
      type: RequestType.get,
      url: charactersUrl,
    )
        .then((response) {
      if (response.body is String) {
        final List<dynamic> jsonData = json.decode(response.body ?? '');
        return jsonData.map((json) => CharacterModel.fromJson(json)).toList();
      } else {
        return [];
      }
    });
  }
}
