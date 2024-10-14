import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:harry_potter_clean/domain/entities/characters_entity.dart';
import 'package:meta/meta.dart';

import '../../../domain/failures/failures.dart';
import '../../../domain/usecases/potter_usecases.dart';

part 'potter_home_state.dart';


const generalFailureMessage = "Ups, something gone wrong failed, please try again";
const serverFailureMessage = "Ups, API Error, please try again";
const cachedFailureMessage = "Ups, API Error, please try again";


class PotterHomeCubit extends Cubit<PotterHomeState> {
  final PotterUsecase potterUsecases;
  PotterHomeCubit({required this.potterUsecases}) : super(PotterHomeInitial());

  void potterRequested() async{
    emit(PotterHomeLoading());
    final failureOrPotter = await potterUsecases.getCharacters();
    failureOrPotter.fold(
        (failure) => emit(PotterStateError(message: _mapFailureToMessage(failure))),
          (character) => emit(PotterHomeLoaded(character: character.characters)),
    );
  }

  String _mapFailureToMessage(Failure failure){
    switch(failure.runtimeType){
      case ServerFailure:
        return generalFailureMessage;
      case CacheFailure:
        return cachedFailureMessage;
      default:
        return generalFailureMessage;
    }
  }
}
