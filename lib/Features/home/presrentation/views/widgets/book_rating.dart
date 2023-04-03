import 'package:flutter/material.dart';
import 'package:untitled/Features/home/data/models/book_model/book_model.dart';

import '../../../../../core/utils/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    Key? key, required this.bookModel,
  }) : super(key: key);

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.star_rate_rounded,
          color: Colors.yellow,
          size: 28.0,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.01,
        ),
        Text(
            bookModel.volumeInfo.averageRating != null ?
            '${bookModel.volumeInfo.averageRating}' :
            '0'
            , style: Styles.textStyle20),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.03,
        ),
        Text(
    bookModel.volumeInfo.ratingsCount != null ?
          '(${bookModel.volumeInfo.ratingsCount.toString()})' :
          '(0)',
          style: Styles.textStyle14.copyWith(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
