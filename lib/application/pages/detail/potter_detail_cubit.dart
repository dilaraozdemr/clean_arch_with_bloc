import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:harry_potter_clean/application/pages/widget/error_message.dart';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import 'package:harry_potter_clean/domain/entities/characters_entity.dart';
import 'package:harry_potter_clean/domain/failures/failures.dart';
import '../../../domain/usecases/potter_usecases.dart';

part 'potter_detail_state.dart';

class PotterDetailCubit extends Cubit<PotterDetailState> {
  final PotterUsecase potterUsecase;

  PotterDetailCubit({required this.potterUsecase}) : super(PotterDetailInitial());

  Future<void> getCharacterDetail(String id) async {
    emit(PotterDetailLoading());
    final Either<Failure, CharactersResponseEntity> result = await potterUsecase.getCharacterDetail(id);

    result.fold(
          (failure) => emit(PotterStateDetailError(message: "Failed to fetch character details")),
          (character) => emit(PotterDetailLoaded(character: character.characters.first)), // Assuming it's a list and you want the first character's detail.
    );
  }
}
