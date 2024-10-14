import 'package:dartz/dartz.dart';
import 'package:harry_potter_clean/data/datasources/potter_remote_datasources.dart';
import 'package:harry_potter_clean/data/exceptions/exceptions.dart';
import 'package:harry_potter_clean/domain/entities/characters_entity.dart';
import 'package:harry_potter_clean/domain/repositories/potter_repo.dart';

import '../../domain/failures/failures.dart';

class PotterRepoImpl implements PotterRepo{
  final PotterRemoteDatasource potterRemoteDataSource;
  PotterRepoImpl({required this.potterRemoteDataSource});

  @override
  Future<Either<Failure, CharactersResponseEntity>> getCharactersDataSource() async {
    try{
      final result = await potterRemoteDataSource.getCharacters();
      return right(result);
    } on ServerExceptions catch(_){
      return left(ServerFailure());
    } catch(e){
      return left(GeneralFailure());
    }
  }

  @override
  Future<Either<Failure, CharactersResponseEntity>> getCharacterDetailDataSource(String id) async{
    try{
      final detail = await potterRemoteDataSource.getCharactersDetail(id);
      return right(detail);
    } on ServerExceptions catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}