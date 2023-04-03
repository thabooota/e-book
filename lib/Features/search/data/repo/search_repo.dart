import 'package:dartz/dartz.dart';
import 'package:untitled/Features/home/data/models/book_model/book_model.dart';
import 'package:untitled/core/errors/failures.dart';

abstract class SearchRepo {
  Future <Either<Failure,List<BookModel>>> fetchSearchBook ({required String searchKey});
}