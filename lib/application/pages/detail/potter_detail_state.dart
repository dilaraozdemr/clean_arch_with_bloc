part of 'potter_detail_cubit.dart';


@immutable
sealed class PotterDetailState extends Equatable {
  const PotterDetailState();

  @override
  List<Object?> get props => [];
}

final class PotterDetailInitial extends PotterDetailState {
  const PotterDetailInitial();
}

final class PotterDetailLoading extends PotterDetailState {
  const PotterDetailLoading();
}

final class PotterDetailLoaded extends PotterDetailState {
  final CharacterEntity character;

  const PotterDetailLoaded({required this.character});

  @override
  List<Object?> get props => [character];
}

final class PotterStateDetailError extends PotterDetailState {
  final String message;
  const PotterStateDetailError({required this.message});

  @override
  List<Object?> get props => [message];
}
