import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/Features/search/data/repos/search_repo.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImp implements SearchRepo {
  ApiService apiService;
  SearchRepoImp(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks(
      {required String searchBook}) async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&q=$searchBook+intitle:$searchBook');
      List<BookModel> books = [];
      if (data['totalItems'] == 0) {
        return left(ServerFailure('No Books Found'));
      }
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }

      return left(ServerFailure(
        e.toString(),
      ));
    }
  }
}
