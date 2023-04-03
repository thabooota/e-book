import 'package:flutter/material.dart';
import 'package:untitled/Features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );
  }
}
