import 'package:sorting_hat/models/character_model.dart';

class AnsweredModel extends CharacterModel {
  int attempts;
  bool isSuccess;

  AnsweredModel({
    required this.attempts,
    required this.isSuccess,
    required super.id,
    required super.name,
    required super.species,
    required super.house,
    required super.dateOfBirth,
    required super.actor,
    required super.image,
    super.alternateNames,
    super.gender,
    super.yearOfBirth,
    super.wizard,
    super.ancestry,
    super.eyeColour,
    super.hairColour,
    super.wand,
    super.patronus,
    super.hogwartsStudent,
    super.hogwartsStaff,
    super.alternateActors,
    super.alive,
  });

  @override
  String toString() {
    return 'CharacterModel(id: $id, name: $name, species: $species, house: $house, dateOfBirth: $dateOfBirth, '
        'actor: $actor, image: $image, attempts: $attempts,isSuccess: $isSuccess)';
  }
}
