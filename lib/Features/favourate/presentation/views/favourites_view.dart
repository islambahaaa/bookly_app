import 'package:bookly_app/Features/favourate/presentation/views/widgets/favourites_view_body.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:flutter/material.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Favourites'),
        centerTitle: true,
      ),
      body: const SafeArea(child: FavouritesViewbody()),
    );
  }
}
