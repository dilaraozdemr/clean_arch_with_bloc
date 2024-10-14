import 'package:equatable/equatable.dart';

class CharactersResponseEntity extends Equatable {
  final List<CharacterEntity> characters;

  const CharactersResponseEntity({required this.characters});

  @override
  List<Object?> get props => [characters];
}

class CharacterEntity extends Equatable {
  final String id;
  final String name;
  final List<String> alternateNames;
  final String species;
  final String gender;
  final String house;
  final String dateOfBirth;
  final int yearOfBirth;
  final bool wizard;
  final String ancestry;
  final String eyeColour;
  final String hairColour;
  final WandEntity wand;
  final String patronus;
  final bool hogwartsStudent;
  final bool hogwartsStaff;
  final String actor;
  final bool alive;
  final String image;

  const CharacterEntity({
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
    required this.alive,
    required this.image,
  });

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

class WandEntity extends Equatable {
  final String wood;
  final String core;
  final int length;

  const WandEntity({
    required this.wood,
    required this.core,
    required this.length,
  });

  @override
  List<Object?> get props => [wood, core, length];
}
