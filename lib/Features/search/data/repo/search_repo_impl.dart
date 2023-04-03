import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:untitled/Features/home/data/models/book_model/book_model.dart';
import 'package:untitled/Features/search/data/repo/search_repo.dart';
import 'package:untitled/core/errors/failures.dart';
import 'package:untitled/core/utils/api_helper.dart';

class SearchRepoImpl implements SearchRepo {
 final ApiHelper apiHelper;

 SearchRepoImpl(this.apiHelper);

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchBook({ String ?searchKey}) async {
    try{
      var data = await apiHelper.get(endPoint: 'volumes?Filtering=free-ebooks&q=$searchKey');

      List<BookModel> booksSearch = [];

      for (var item in data['items']) {
          booksSearch.add(BookModel.fromJson(item));
      }
      return right(booksSearch);
    }catch (e){
      if(e is DioError)
        {
          return left(ServerFailure.fromDioError(e));
        }
      return left(ServerFailure(e.toString()));
    }
  }
}