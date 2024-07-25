import 'package:bookly_app/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class FavouritesViewbody extends StatelessWidget {
  const FavouritesViewbody({super.key});

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
