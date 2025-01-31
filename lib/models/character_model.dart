// ignore_for_file: constant_identifier_names

enum Houses {
  Gryffindor,
  Slytherin,
  Ravenclaw,
  Hufflepuff,
  other,
}

class CharacterModel {
  final String id;
  final String? name;
  final List<String>? alternateNames;
  final String? species;
  final String? gender;
  final Houses? house;
  final String? dateOfBirth;
  final int? yearOfBirth;
  final bool? wizard;
  final String? ancestry;
  final String? eyeColour;
  final String? hairColour;
  final Wand? wand;
  final String? patronus;
  final bool? hogwartsStudent;
  final bool? hogwartsStaff;
  final String? actor;
  final List<String>? alternateActors;
  final bool? alive;
  final String? image;

  CharacterModel({
    required this.id,
    required this.name,
    required this.alternateNames,
    required this.species,
    required this.gender,
    required this.house,
    required this.dateOfBirth,
    required this.yearOfBirth,
    required this.wizard,
    required this.ancestry,
    required this.eyeColour,
    required this.hairColour,
    required this.wand,
    required this.patronus,
    required this.hogwartsStudent,
    required this.hogwartsStaff,
    required this.actor,
    required this.alternateActors,
    required this.alive,
    required this.image,
  });

  static Houses houseToEnum(String house) {
    switch (house.toLowerCase()) {
      case 'gryffindor':
        return Houses.Gryffindor;
      case 'slytherin':
        return Houses.Slytherin;
      case 'ravenclaw':
        return Houses.Ravenclaw;
      case 'hufflepuff':
        return Houses.Hufflepuff;
      default:
        return Houses.other;
    }
  }

  static String houseToString(Houses? house) {
    switch (house) {
      case Houses.Gryffindor:
        return 'Gryffindor';
      case Houses.Slytherin:
        return 'Slytherin';
      case Houses.Ravenclaw:
        return 'Ravenclaw';
      case Houses.Hufflepuff:
        return 'Hufflepuff';
      default:
        return '';
    }
  }

  static CharacterModel fromJson(Map<dynamic, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      alternateNames: List<String>.from(json['alternate_names']),
      species: json['species'],
      gender: json['gender'],
      house: houseToEnum(json['house']),
      dateOfBirth: json['dateOfBirth'],
      yearOfBirth: json['yearOfBirth'],
      wizard: json['wizard'],
      ancestry: json['ancestry'],
      eyeColour: json['eyeColour'],
      hairColour: json['hairColour'],
      wand: Wand.fromJson(json['wand']),
      patronus: json['patronus'],
      hogwartsStudent: json['hogwartsStudent'],
      hogwartsStaff: json['hogwartsStaff'],
      actor: json['actor'],
      alternateActors: List<String>.from(json['alternate_actors']),
      alive: json['alive'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'alternate_names': alternateNames,
      'species': species,
      'gender': gender,
      'house': houseToString(house),
      'dateOfBirth': dateOfBirth,
      'yearOfBirth': yearOfBirth,
      'wizard': wizard,
      'ancestry': ancestry,
      'eyeColour': eyeColour,
      'hairColour': hairColour,
      'wand': wand?.toJson(),
      'patronus': patronus,
      'hogwartsStudent': hogwartsStudent,
      'hogwartsStaff': hogwartsStaff,
      'actor': actor,
      'alternate_actors': alternateActors,
      'alive': alive,
      'image': image,
    };
  }

  @override
  String toString() {
    return 'CharacterModel(id: $id, name: $name, alternateNames: $alternateNames, species: $species, '
        'gender: $gender, house: $house, dateOfBirth: $dateOfBirth, yearOfBirth: $yearOfBirth, wizard: $wizard, '
        'ancestry: $ancestry, eyeColour: $eyeColour, hairColour: $hairColour, wand: $wand, patronus: $patronus, '
        'hogwartsStudent: $hogwartsStudent, hogwartsStaff: $hogwartsStaff, actor: $actor, alternateActors: $alternateActors, '
        'alive: $alive, image: $image)';
  }
}

class Wand {
  final String wood;
  final String core;
  final double? length;

  Wand({
    required this.wood,
    required this.core,
    this.length,
  });

  factory Wand.fromJson(Map<String, dynamic> json) {
    return Wand(
      wood: json['wood'],
      core: json['core'],
      length: json['length'] != null ? (json['length'] as num).toDouble() : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'wood': wood,
      'core': core,
      'length': length,
    };
  }

  @override
  String toString() {
    return 'Wand(wood: $wood, core: $core, length: $length)';
  }
}
