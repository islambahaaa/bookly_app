part of 'favourites_cubit.dart';

sealed class FavouritesState extends Equatable {
  const FavouritesState();

  @override
  List<Object> get props => [];
}

final class FavouritesInitial extends FavouritesState {}

final class FavouritesAdded extends FavouritesState {}

final class FavouritesLoading extends FavouritesState {}

final class FavouritesRemoved extends FavouritesState {}

final class FavouritesFailure extends FavouritesState {}

final class FavouritesLoaded extends FavouritesState {}

final class FavouritesChanged extends FavouritesState {
  final List<BookModel> favouritesList;
  const FavouritesChanged(this.favouritesList);
}
