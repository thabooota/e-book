import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/Features/home/data/repos/home_repo_impl.dart';
import 'package:untitled/Features/home/presrentation/manager/featured_similar_book_cubit/featured_similar_book_cubit.dart';
import 'package:untitled/Features/home/presrentation/views/home_view.dart';
import 'package:untitled/Features/search/presentation/views/search_view.dart';
import 'package:untitled/core/utils/service_locator.dart';
import '../../Features/home/data/models/book_model/book_model.dart';
import '../../Features/home/presrentation/views/book_details_view.dart';
import '../../Features/splash/presentation/views/spalsh_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/homeScreen',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/bookDetails',
        builder: (context, state) =>  BlocProvider(
            create:  (context) => FeaturedSimilarCubit(getIt.get<HomeRepoImpl>()),
            child:  BookDetailsView(
              bookModel: state.extra as BookModel,
            )),
      ),
      GoRoute(
        path: '/searchScreen',
        builder: (context, state) => const SearchView() ,
      ),
    ],
  );
}