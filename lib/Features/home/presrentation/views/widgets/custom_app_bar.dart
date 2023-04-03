import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/icons.dart';

class customAppBar extends StatelessWidget {
  const customAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
      child: Row(
        children: [
          Image.asset(
            AssetsData.logo,
            height: MediaQuery.of(context).size.height / 25,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push('/searchScreen');
            },
            icon: const Icon(
              IconBroken.Search,
            ),
          ),
        ],
      ),
    );
  }
}
