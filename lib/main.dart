
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/Features/home/data/repos/home_repo_impl.dart';
import 'package:untitled/Features/home/presrentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/core/utils/app_router.dart';
import 'package:untitled/core/utils/service_locator.dart';
import 'Features/home/presrentation/manager/fetch_newset_books_cubit/fetch_newset_cubit.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchFeatureBooks(),
        ),
        BlocProvider(
          create: (context) => FetchNewestBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: scaffoldColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
