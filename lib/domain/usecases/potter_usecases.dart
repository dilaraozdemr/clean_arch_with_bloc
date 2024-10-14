import 'package:dartz/dartz.dart';
import 'package:harry_potter_clean/domain/entities/characters_entity.dart';
import 'package:harry_potter_clean/domain/repositories/potter_repo.dart';

import '../failures/failures.dart';

class PotterUsecase{
  final PotterRepo potterRepo;
  PotterUsecase({required this.potterRepo});
  Future<Either<Failure, CharactersResponseEntity>> getCharacters() async {
    return potterRepo.getCharactersDataSource();
  }
  Future<Either<Failure, CharactersResponseEntity>> getCharacterDetail(String id) async {
    return potterRepo.getCharacterDetailDataSource(id);
  }
}