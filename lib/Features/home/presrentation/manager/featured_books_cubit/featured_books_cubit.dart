import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import '../../../data/repos/home_repo.dart';
import 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeatureBooks() async {
    emit(FeaturedBooksLoading());
    debugPrint("Loading");
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold((failure) {
      debugPrint("Error");
      debugPrint(failure.errMessage);
      emit(FeaturedBooksFailure(failure.errMessage));
    }, (books) {
      debugPrint(books[0].volumeInfo.imageLinks!.smallThumbnail);
      emit(FeaturedBooksSuccess(books));
    });
  }
}
