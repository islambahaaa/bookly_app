import 'package:bookly_app/Features/favourate/presentation/manager/favourites_cubit/favourites_cubit.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<FavouritesCubit>(context);
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsRoute, extra: book);
      },
      child: SizedBox(
        height: 140,
        child: Row(
          children: [
            CustomBookImage(
                borderRadius: BorderRadius.circular(12),
                imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? ''),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      book.volumeInfo.title ?? 'No Title',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Styles.textStyle20.copyWith(
                        fontFamily: kGtSectraFine,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    book.volumeInfo.authors?.first ?? 'Unknown Author',
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle14,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      BookRating(
                        count: book.volumeInfo.pageCount ?? 0,
                      ),
                      BlocConsumer<FavouritesCubit, FavouritesState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          return IconButton(
                            onPressed: () {
                              bloc.add(book);
                            },
                            icon: bloc.isExist(book)
                                ? const Icon(Icons.favorite)
                                : const Icon(Icons.favorite_outline),
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
