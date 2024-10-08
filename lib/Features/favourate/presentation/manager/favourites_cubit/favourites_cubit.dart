import 'package:bloc/bloc.dart';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  FavouritesCubit() : super(FavouritesInitial());
  List<BookModel> favouritesList = [];
  var booksBox = Hive.box<BookModel>(kBooksBox);
  void addBookToFavourites(BookModel book) async {
    if (isExist(book)) {
      emit(FavouritesLoading());
      await booksBox.deleteAt(findIndex(book));
      fetchFavourites();
      emit(FavouritesRemoved());
    } else {
      emit(FavouritesLoading());
      try {
        await booksBox.add(book);
        fetchFavourites();
        emit(FavouritesAdded());
      } catch (e) {
        emit(FavouritesFailure());
      }
    }
  }

  bool isExist(BookModel book) {
    for (var b in favouritesList) {
      if (b.id == book.id) {
        return true;
      }
    }
    return false;
  }

  int findIndex(BookModel book) {
    for (var b in favouritesList) {
      if (b.id == book.id) {
        return favouritesList.indexOf(b);
      }
    }
    return -1;
  }

  void fetchFavourites() {
    favouritesList = booksBox.values.toList();
  }
}
