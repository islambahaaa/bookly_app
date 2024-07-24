import 'package:bookly_app/Features/home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:flutter/material.dart';

class FavouratesView extends StatelessWidget {
  const FavouratesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FavouratesViewbody(),
    );
  }
}

class FavouratesViewbody extends StatelessWidget {
  const FavouratesViewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 5,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text('data'),
            // child: BookListViewItem(
            //   book: state.books[index],
            // ),
          );
        });
  }
}
