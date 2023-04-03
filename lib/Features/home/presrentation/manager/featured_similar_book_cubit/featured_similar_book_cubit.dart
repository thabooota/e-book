import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../data/repos/home_repo.dart';
import 'featured_similar_books_state.dart';

class FeaturedSimilarCubit extends Cubit<FeaturedSimilarBooksState> {
  FeaturedSimilarCubit(this.homeRepo) : super(FeaturedSimilarBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeatureSimilarBooks({required String category}) async {
    emit(FeaturedSimilarBooksLoading());
    debugPrint('Loading');
    var result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold((failure) {
      debugPrint(failure.errMessage);
      emit(FeaturedSimilarBooksFailure(failure.errMessage));
    }, (books) {
      debugPrint(books[0].volumeInfo.categories![0]);
      emit(FeaturedSimilarBooksSuccess(books));
    });
  }
}