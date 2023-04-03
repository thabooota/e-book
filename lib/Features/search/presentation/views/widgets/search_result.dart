import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Features/search/data/repo/search_repo_impl.dart';
import 'package:untitled/Features/search/presentation/manage/featured_search_books_cubit/search_cubit.dart';
import 'package:untitled/Features/search/presentation/manage/featured_search_books_cubit/search_state.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/core/utils/service_locator.dart';
import 'package:untitled/core/widgets/custom_error_widget.dart';
import 'package:untitled/core/widgets/custom_loading_widget.dart';

import '../../../../home/presrentation/views/widgets/custom_best_seller_list_item.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBookCubit(getIt.get<SearchRepoImpl>())..fetchSearchBook(searchKey: searchKey!),
      child: BlocBuilder<SearchBookCubit,SearchFeatureState>(
        builder: (context, state) {
          if(state is SearchFeatureStateSuccess)
            {
              return ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: state.booksSearch.length,
                itemBuilder: (context, index) {
                  return  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: NewestSellerListItem(
                      bookModel: state.booksSearch[index],
                    ),
                  );
                },
              );
            }
          else if(state is SearchFeatureStateFailure)
            {
              return CustomErrorWidget(errMessage: state.errMessage);
            }else {
            return const CustomLoadingWidget();
          }
        },
      ),
    );
  }
}