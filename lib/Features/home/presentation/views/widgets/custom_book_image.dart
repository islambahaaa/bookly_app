import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage(
      {super.key, this.borderRadius, required this.imageUrl, this.book});
  final BorderRadius? borderRadius;
  final String imageUrl;
  final BookModel? book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (book != null) {
          GoRouter.of(context).push(AppRouter.kBookDetailsRoute, extra: book);
        }
      },
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(20),
        child: AspectRatio(
          aspectRatio: 2.6 / 4,
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.fill,
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
