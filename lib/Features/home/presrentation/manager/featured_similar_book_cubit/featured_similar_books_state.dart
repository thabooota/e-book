import '../../../data/models/book_model/book_model.dart';

abstract class FeaturedSimilarBooksState {}

class FeaturedSimilarBooksInitial extends FeaturedSimilarBooksState {}

class FeaturedSimilarBooksSuccess extends FeaturedSimilarBooksState {
  final List<BookModel> books;

  FeaturedSimilarBooksSuccess(this.books);
}

class FeaturedSimilarBooksLoading extends FeaturedSimilarBooksState {}

class FeaturedSimilarBooksFailure extends FeaturedSimilarBooksState {
  final String errMessage;

  FeaturedSimilarBooksFailure(this.errMessage);
}
