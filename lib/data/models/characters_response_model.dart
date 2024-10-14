import 'package:equatable/equatable.dart';
import 'package:harry_potter_clean/domain/entities/characters_entity.dart';


class CharactersResponseModel extends CharactersResponseEntity with EquatableMixin {
  CharactersResponseModel({required List<CharacterModel> characters})
      : super(characters: characters);

  factory CharactersResponseModel.fromJson(List<dynamic> json) {
    return CharactersResponseModel(
      characters: json.map((item) => CharacterModel.fromJson(item)).toList(),
    );
  }

  List<dynamic> toJson() {
    return characters.map((character) => (character as CharacterModel).toJson()).toList();
  }

  @override
  List<Object?> get props => [characters];
}
class CharacterModel extends CharacterEntity with EquatableMixin{
  CharacterModel({
    required super.id,
    required super.name,
    required super.alternateNames,
    required super.species,
    required super.gender,
    required super.house,
    required super.dateOfBirth,
    required super.yearOfBirth,
    required super.wizard,
    required super.ancestry,
    required super.eyeColour,
    required super.hairColour,
    required super.wand,
    required super.patronus,
    required super.hogwartsStudent,
    required super.hogwartsStaff,
    required super.actor,
    required super.alive,
    required super.image});

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      alternateNames: List<String>.from(json['alternate_names'] ?? []),
      species: json['species'] ?? '',
      gender: json['gender'] ?? '',
      house: json['house'] ?? '',
      dateOfBirth: json['dateOfBirth'] ?? '',
      yearOfBirth: json['yearOfBirth'] ?? 0,
      wizard: json['wizard'] ?? false,
      ancestry: json['ancestry'] ?? '',
      eyeColour: json['eyeColour'] ?? '',
      hairColour: json['hairColour'] ?? '',
      wand: json['wand'] != null ? WandModel.fromJson(json['wand']) : WandModel(wood: '', core: '', length: 0),
      patronus: json['patronus'] ?? '',
      hogwartsStudent: json['hogwartsStudent'] ?? false,
      hogwartsStaff: json['hogwartsStaff'] ?? false,
      actor: json['actor'] ?? '',
      alive: json['alive'] ?? false,
      image: json['image'] ?? "https://static.wikia.nocookie.net/harrypotter/images/a/ae/Hogwartscrest.png/revision/latest?cb=20110806202805",
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'alternate_names': alternateNames,
      'species': species,
      'gender': gender,
      'house': house,
      'dateOfBirth': dateOfBirth,
      'yearOfBirth': yearOfBirth,
      'wizard': wizard,
      'ancestry': ancestry,
      'eyeColour': eyeColour,
      'hairColour': hairColour,
      'wand': (wand as WandModel).toJson(),
      'patronus': patronus,
      'hogwartsStudent': hogwartsStudent,
      'hogwartsStaff': hogwartsStaff,
      'actor': actor,
      'alive': alive,
      'image': image,
    };
  }

  @override
  List<Object?> get props => [
    id,
    name,
    alternateNames,
    species,
    gender,
    house,
    dateOfBirth,
    yearOfBirth,
    wizard,
    ancestry,
    eyeColour,
    hairColour,
    wand,
    patronus,
    hogwartsStudent,
    hogwartsStaff,
    actor,
    alive,
    image,
  ];
}


class WandModel extends WandEntity with EquatableMixin {
  WandModel({
    required String wood,
    required String core,
    required int length,
  }) : super(wood: wood, core: core, length: length);

  factory WandModel.fromJson(Map<String, dynamic> json) {
    return WandModel(
      wood: json['wood'],
      core: json['core'],
      length: (json['length'] as num?)?.toInt() ?? 0,
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
  List<Object?> get props => [wood, core, length];
}
