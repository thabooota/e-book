import 'package:flutter/material.dart';
import 'package:untitled/Features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:untitled/Features/search/presentation/views/widgets/search_result.dart';
import 'package:untitled/constants.dart';
import '../../../../../core/utils/styles.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height *0.08,
            horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            const CustomSearchTextField(),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Search Result',
              style: Styles.textStyle18,
            ),
            const SizedBox(
              height: 16,
            ),
          if(searchKey != null)
            const Expanded(
             child: SearchResultListView(),),
          ],
        ),
      ),
    );
  }
}
