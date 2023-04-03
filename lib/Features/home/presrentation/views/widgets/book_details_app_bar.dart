import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class bookDetailsAppBar extends StatelessWidget {
  const bookDetailsAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            iconSize: 30.0,
            icon: const Icon(Icons.close_rounded)),
        const Spacer(),
        IconButton(
          onPressed: () {},
          iconSize: 25.0,
          icon: const Icon(Icons.shopping_cart_outlined),
        ),
      ],
    );
  }
}
