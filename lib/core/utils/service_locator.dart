import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:untitled/Features/search/data/repo/search_repo_impl.dart';
import '../../Features/home/data/repos/home_repo_impl.dart';
import 'api_helper.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiHelper>(ApiHelper(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt.get<ApiHelper>(),
    ),);
  getIt.registerSingleton<SearchRepoImpl>(SearchRepoImpl(
    getIt.get<ApiHelper>(),
  ));
}
