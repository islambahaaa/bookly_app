import 'package:bookly_app/Features/favourate/presentation/manager/favourites_cubit/favourites_cubit.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomBookDetailsAppBar extends StatelessWidget {
  const CustomBookDetailsAppBar({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(
            Icons.close,
            size: 32,
          ),
        ),
        BlocBuilder<FavouritesCubit, FavouritesState>(
          builder: (context, state) {
            return IconButton(
              onPressed: () {
                BlocProvider.of<FavouritesCubit>(context)
                    .addBookToFavourites(book);
              },
              icon: BlocProvider.of<FavouritesCubit>(context).isExist(book)
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_outline),
            );
          },
        ),
      ],
    );
  }
}
