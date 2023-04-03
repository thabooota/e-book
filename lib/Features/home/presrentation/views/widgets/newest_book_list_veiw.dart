import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Features/home/presrentation/manager/fetch_newset_books_cubit/fetch_newset_books_state.dart';
import 'package:untitled/Features/home/presrentation/manager/fetch_newset_books_cubit/fetch_newset_cubit.dart';
import 'package:untitled/core/widgets/custom_error_widget.dart';
import 'package:untitled/core/widgets/custom_loading_widget.dart';
import 'custom_best_seller_list_item.dart';

class NewestSellerListView extends StatelessWidget {
  const NewestSellerListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchNewestBooksCubit, FetchNewestBooksState>(
      builder: (context, state) {
        if (state is FetchNewestBookSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => NewestSellerListItem(
                      bookModel: state.books[index],
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                itemCount: state.books.length
            ),
          );
        } else if (state is FetchNewestBookFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
