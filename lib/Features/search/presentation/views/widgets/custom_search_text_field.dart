import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/Features/search/data/repo/search_repo_impl.dart';
import 'package:untitled/Features/search/presentation/manage/featured_search_books_cubit/search_cubit.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/core/utils/service_locator.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({super.key});

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  @override
  Widget build(BuildContext context) {
   var controller = TextEditingController();
    return TextField(
      controller: controller,
      onSubmitted: (value) {
        searchKey = value;
        SearchBookCubit(getIt.get<SearchRepoImpl>())..fetchSearchBook(searchKey: value);
      },
      decoration: InputDecoration(
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        hintText: 'Search',
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              searchKey = controller.toString();
              SearchBookCubit(getIt.get<SearchRepoImpl>())..fetchSearchBook(searchKey: controller.toString());
            });
          },
          icon: const Opacity(
            opacity: .8,
            child: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 22,
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(
        12,
      ),
    );
  }
}