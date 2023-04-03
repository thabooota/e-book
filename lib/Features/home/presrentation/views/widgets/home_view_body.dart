import 'package:flutter/material.dart';
import 'package:untitled/Features/home/presrentation/views/widgets/newest_book_list_veiw.dart';
import 'package:untitled/Features/home/presrentation/views/widgets/custom_app_bar.dart';
import '../../../../../core/utils/styles.dart';
import 'featured_list_view.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const customAppBar(),
                SizedBox(
                height: MediaQuery.of(context).size.height * 0.009,
               ),
               const featureListView(),
               SizedBox(
               height: MediaQuery.of(context).size.height * .04,
             ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                'Newest Programming Books',
                style: Styles.textStyle18,
              ),
            ),
          ],
        )),
        const SliverToBoxAdapter(
          child: NewestSellerListView(),
        ),
        //
      ],
    );
  }
}
