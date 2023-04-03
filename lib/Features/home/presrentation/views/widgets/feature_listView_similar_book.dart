import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/Features/home/presrentation/manager/featured_similar_book_cubit/featured_similar_book_cubit.dart';
import 'package:untitled/Features/home/presrentation/manager/featured_similar_book_cubit/featured_similar_books_state.dart';
import 'package:untitled/core/utils/icons.dart';
import 'package:untitled/core/widgets/custom_error_widget.dart';
import 'package:untitled/core/widgets/custom_loading_widget.dart';

class FeatureListViewSimilarBook extends StatelessWidget {
  const FeatureListViewSimilarBook({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedSimilarCubit, FeaturedSimilarBooksState>(
      builder: (context, state) {
        if (state is FeaturedSimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .19,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    GoRouter.of(context).pushReplacement('/bookDetails' , extra: state.books[index]);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        placeholder: (context, url) => const CustomLoadingWidget(),
                          errorWidget: (context, url, error) => const Icon(IconBroken.Danger),
                          imageUrl: state.books[index].volumeInfo.imageLinks!.smallThumbnail),
                    )
                  )),
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
            ),
          );
        }else if (state is FeaturedSimilarBooksFailure){
          return CustomErrorWidget(errMessage: state.errMessage);
        }else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
