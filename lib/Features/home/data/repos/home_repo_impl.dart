import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:untitled/Features/home/data/repos/home_repo.dart';
import 'package:untitled/core/errors/failures.dart';
import 'package:untitled/core/utils/api_helper.dart';

import '../models/book_model/book_model.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiHelper apiHelper;

  HomeRepoImpl(this.apiHelper);

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiHelper.get(
          endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest &q=programming');

      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }

      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiHelper.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=flutter');

      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category}) async{
    try {
      var data = await apiHelper.get(
          endPoint: 'volumes?Filtering=free-ebooks&Sorting=relevance&q=$category');

      List<BookModel> books = [];
      for (var item in data['items']) {
        try{
          books.add(BookModel.fromJson(item));
        }
        catch(e){}

      }
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
