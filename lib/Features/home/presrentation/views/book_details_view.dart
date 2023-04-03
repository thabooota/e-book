import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Features/home/data/models/book_model/book_model.dart';
import 'package:untitled/Features/home/presrentation/manager/featured_similar_book_cubit/featured_similar_book_cubit.dart';
import 'package:untitled/Features/home/presrentation/views/widgets/book_details_view_body.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({Key? key, required this.bookModel,}) : super(key: key);

  final BookModel bookModel;
  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {

  @override
  void initState() {
    BlocProvider.of<FeaturedSimilarCubit>(context).fetchFeatureSimilarBooks(category: widget.bookModel.volumeInfo.categories![0]);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: BodyDetailsViewBody(
        bookModel: widget.bookModel,
      ),
    );
  }
}
