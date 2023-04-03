import 'package:flutter/material.dart';
import 'package:untitled/Features/home/data/models/book_model/book_model.dart';
import 'package:untitled/core/utils/styles.dart';
import 'book_action.dart';
import 'custom_list_view_item.dart';
import 'book_details_app_bar.dart';
import 'feature_listView_similar_book.dart';

class BodyDetailsViewBody extends StatelessWidget {
  const BodyDetailsViewBody({Key? key, required this.bookModel,}) : super(key: key);
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28.0, horizontal: 18.0),
      child: Column(
        children: [
          const bookDetailsAppBar(),
          SizedBox(
              height: MediaQuery.of(context).size.height * .34,
              child: CustomBookImage(
                imageUrl: bookModel.volumeInfo.imageLinks!.thumbnail,
              ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
          ),
           Text(
            bookModel.volumeInfo.title,
            style: Styles.textStyle30,
             maxLines: 2,
             overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.015,
          ),
          Text(
            bookModel.volumeInfo.authors[0],
            style: Styles.textStyle16.copyWith(
              color: Colors.grey[400],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .01,
          ),
          //BookRating(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.015,
          ),
           BookAction(bookModel: bookModel),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'You can also like',
                style: Styles.textStyle20,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          const FeatureListViewSimilarBook(),
        ],
      ),
    );
  }
}
