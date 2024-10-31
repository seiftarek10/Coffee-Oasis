import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppCachedNetworkImage extends StatelessWidget {
  const AppCachedNetworkImage({
    super.key,
    required this.photo,
  });

  final String? photo;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: photo!,
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        size: 32,
        color: Colors.black,
      ),
      fit: BoxFit.fill,
    );
  }
}
