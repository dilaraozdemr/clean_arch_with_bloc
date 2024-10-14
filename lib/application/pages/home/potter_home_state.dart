part of 'potter_home_cubit.dart';

@immutable
sealed class PotterHomeState extends Equatable{
  const PotterHomeState();
  @override
  List<Object> get props => [];
}

final class PotterHomeInitial extends PotterHomeState {
  const PotterHomeInitial();
}

final class PotterHomeLoading extends PotterHomeState {
  const PotterHomeLoading();
}

final class PotterHomeLoaded extends PotterHomeState{
  final List<CharacterEntity> character;
  const PotterHomeLoaded({required this.character});

  @override
  List<Object> get props => [character];
}

final class PotterStateError extends PotterHomeState {
  final String message;
  const PotterStateError({required this.message});

  @override
  List<Object> get props => [message];
}
