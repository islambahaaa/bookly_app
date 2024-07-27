import 'package:bookly_app/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
        builder: (context, state) {
      if (state is NewestBooksSuccess) {
        return SliverList.builder(
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BookListViewItem(
                      book: state.books[index],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    const Divider(
                      thickness: 0.15,
                    ),
                  ],
                ),
              );
            });
      } else if (state is NewestBooksFailure) {
        return CustomErrorWidget(errMessage: state.errMessage);
      } else {
        return const SliverFillRemaining(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: ShimmerNewestListView(),
        ));
      }
    });
  }
}
