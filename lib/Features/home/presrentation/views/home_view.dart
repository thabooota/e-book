import 'package:flutter/material.dart';
import 'package:untitled/Features/home/presrentation/views/widgets/home_view_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeScreenBody(),
    );
  }
}
