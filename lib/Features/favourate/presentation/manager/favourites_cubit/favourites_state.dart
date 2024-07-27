part of 'favourites_cubit.dart';

sealed class FavouritesState extends Equatable {
  const FavouritesState();

  @override
  List<Object> get props => [];
}

final class FavouritesInitial extends FavouritesState {}

final class FavouritesAdded extends FavouritesState {}

final class FavouritesRemoved extends FavouritesState {}

final class FavouritesFailure extends FavouritesState {}

final class FavouritesLoaded extends FavouritesState {}
