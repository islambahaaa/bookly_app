import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/search/data/repos/search_repo.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;
  Future<void> fetchSearchedBooks({required String searchBook}) async {
    emit(SearchLoading());
    var result = await searchRepo.fetchSearchedBooks(searchBook: searchBook);
    result.fold((failure) {
      emit(SearchFailure(failure.errMessage));
    }, (books) {
      emit(SearchSuccess(books));
    });
  }
}
