import '../../../data/models/book_model/book_model.dart';

abstract class FetchNewestBooksState {}

class FetchNewestBookInitial extends FetchNewestBooksState {}

class FetchNewestBookSuccess extends FetchNewestBooksState {
  final List<BookModel> books;

  FetchNewestBookSuccess(this.books);
}

class FetchNewestBookLoading extends FetchNewestBooksState {}

class FetchNewestBookFailure extends FetchNewestBooksState {
  final String errMessage;

  FetchNewestBookFailure(this.errMessage);
}
