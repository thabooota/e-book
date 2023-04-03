import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:untitled/core/utils/icons.dart';
import 'package:untitled/core/widgets/custom_loading_widget.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: AspectRatio(
          aspectRatio: 2.7 / 4,
          child: CachedNetworkImage(
              imageUrl: imageUrl,
            fit: BoxFit.fill,
            placeholder: (context, url) => const CustomLoadingWidget(),
            errorWidget: (context, url, error) => const Icon(IconBroken.Danger),
          ),
        ),
      ),
    );
  }
}
