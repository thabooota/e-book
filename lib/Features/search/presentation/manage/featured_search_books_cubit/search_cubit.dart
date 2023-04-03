import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Features/search/presentation/manage/featured_search_books_cubit/search_state.dart';
import '../../../data/repo/search_repo.dart';

class SearchBookCubit extends Cubit<SearchFeatureState>
{
  SearchBookCubit(this.searchRepo) : super(SearchFeatureStateInitial());

  final SearchRepo searchRepo;

  Future<void>fetchSearchBook({required String searchKey}) async{
    emit(SearchFeatureStateLoading());
    debugPrint('Loading');
    var result = await searchRepo.fetchSearchBook(searchKey: searchKey);
    result.fold((failure) {
      debugPrint(failure.errMessage);
      emit(SearchFeatureStateFailure(failure.errMessage));
    }, (books) {
      debugPrint(books[0].volumeInfo.title);
      emit(SearchFeatureStateSuccess(books));
    });
  }
}