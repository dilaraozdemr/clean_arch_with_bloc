import 'package:dartz/dartz.dart';
import 'package:harry_potter_clean/domain/entities/characters_entity.dart';
import 'package:harry_potter_clean/domain/failures/failures.dart';

abstract class PotterRepo{
  Future<Either<Failure, CharactersResponseEntity>> getCharactersDataSource();
  Future<Either<Failure, CharactersResponseEntity>> getCharacterDetailDataSource(String id);
}