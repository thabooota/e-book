import 'package:flutter/material.dart';
import 'package:untitled/Features/home/data/models/book_model/book_model.dart';
import 'package:untitled/core/widgets/custom_button.dart';
import '../../../../../core/functions/luncher_url.dart';

class BookAction extends StatelessWidget {
  const BookAction({
    Key? key, required this.bookModel,
  }) : super(key: key);

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children:  [
          const Expanded(
            child: CustomButton(
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                topLeft: Radius.circular(16),
              ),
              text: 'Free',
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: ()  {
                launchCustomUri(context, bookModel.volumeInfo.previewLink!);
              },
              backgroundColor: const Color(0xffED8262),
              textColor: Colors.white,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              text: 'Preview',
            ),
          ),
        ],
      ),
    );
  }
}
