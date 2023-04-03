import '../../../../home/data/models/book_model/book_model.dart';

abstract class SearchFeatureState {}

class SearchFeatureStateInitial extends SearchFeatureState{}
class SearchFeatureStateLoading extends SearchFeatureState{}
class SearchFeatureStateSuccess extends SearchFeatureState{
  final List<BookModel> booksSearch;

  SearchFeatureStateSuccess(this.booksSearch);
}
class SearchFeatureStateFailure extends SearchFeatureState{
  final String errMessage;

  SearchFeatureStateFailure(this.errMessage);
}