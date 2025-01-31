import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorting_hat/models/answered_model.dart';
import 'package:sorting_hat/models/character_model.dart';

class AnsweredProvider with ChangeNotifier {
  List<AnsweredModel> answered = [];
  AnsweredModel? editingAnswer;
  AnsweredModel? chosenAnswer;
  List<String> searchableAnswers = [];

  int total = 0;
  int failed = 0;
  int success = 0;

  void reset() {
    total = 0;
    failed = 0;
    success = 0;
    answered.clear();
    searchableAnswers.clear();
    notifyListeners();
  }

  //according to 'single responsibility' this func uses two different func inside but combined in one to decrease count of code in UI layer
  bool checkAndUpdate({required CharacterModel character, required Houses house}) {
    bool isSuccess = checkHouse(character, house);

    update(character, house, isSuccess);

    return isSuccess;
  }

  bool checkHouse(CharacterModel character, Houses house) {
    return character.house == house;
  }

  void update(CharacterModel character, Houses house, isSuccess) {
    int ind = answered.indexWhere((e) => e.id == character.id);
    if (ind == -1) {
      searchableAnswers.add('${character.name}');
      answered.add(AnsweredModel(
          id: character.id,
          name: character.name,
          house: character.house,
          dateOfBirth: character.dateOfBirth,
          actor: character.actor,
          species: character.species,
          image: character.image,
          attempts: 1,
          isSuccess: isSuccess));
    } else {
      answered[ind].attempts++;
      answered[ind].isSuccess = isSuccess;
    }

    total++;
    if (isSuccess) {
      editingAnswer = null;
      success++;
    } else {
      failed++;
    }
    notifyListeners();
  }

  void setChoice(int? ind) {
    if (ind != null) {
      chosenAnswer = answered[ind];
    } else {
      chosenAnswer = null;
    }
    notifyListeners();
  }
}

final answeredProvider = ChangeNotifierProvider<AnsweredProvider>((ref) {
  return AnsweredProvider();
});
