import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/Features/home/data/models/book_model/book_model.dart';
import 'package:untitled/Features/home/presrentation/views/widgets/book_rating.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_list_view_item.dart';

class NewestSellerListItem extends StatelessWidget {
  const NewestSellerListItem({
    Key? key, required this.bookModel,
  }) : super(key: key);

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => GoRouter.of(context).push('/bookDetails' , extra: bookModel),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width *.25,
            child: CustomBookImage(
              imageUrl: bookModel.volumeInfo.imageLinks!.smallThumbnail,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                    bookModel.volumeInfo.title,
                    style: Styles.textStyle20,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                ),
                  ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                 Text(
                  bookModel.volumeInfo.authors[0],
                  style: Styles.textStyle16.copyWith(
                    color: Colors.white54
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  children:  [
                    Text(
                        'Free',
                    style: Styles.textStyle16.copyWith(
                      color: Colors.lightBlueAccent
                    ),
                    ),
                    const Spacer(),
                    BookRating(bookModel: bookModel,),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
