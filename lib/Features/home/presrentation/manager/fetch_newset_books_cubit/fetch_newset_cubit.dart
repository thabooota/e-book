import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled/Features/home/data/repos/home_repo.dart';
import 'package:untitled/Features/home/presrentation/manager/fetch_newset_books_cubit/fetch_newset_books_state.dart';

class FetchNewestBooksCubit extends Cubit<FetchNewestBooksState> {
  FetchNewestBooksCubit(this.homeRepo) : super(FetchNewestBookInitial());

  final HomeRepo homeRepo;

  Future<void> fetchNewestBooks() async {
    emit(FetchNewestBookLoading());
    var result = await homeRepo.fetchNewestBooks();
    result.fold((failure) {
      emit(FetchNewestBookFailure(failure.errMessage));
    }, (books) {
      emit(FetchNewestBookSuccess(books));
    });
  }
}
