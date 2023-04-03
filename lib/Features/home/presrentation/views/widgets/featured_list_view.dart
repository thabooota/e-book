import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/Features/home/presrentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:untitled/Features/home/presrentation/manager/featured_books_cubit/featured_books_state.dart';
import 'package:untitled/core/widgets/custom_error_widget.dart';
import 'package:untitled/core/widgets/custom_loading_widget.dart';
import 'custom_list_view_item.dart';

class featureListView extends StatelessWidget {
  const featureListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => InkWell(
                  onTap: () => GoRouter.of(context).push('/bookDetails' , extra: state.books[index]),
                  child: CustomBookImage(
                    imageUrl: state.books[index].volumeInfo.imageLinks!.thumbnail,
                  )),
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(
            errMessage: state.errMessage,
          );
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
