import 'package:bookly_app/Features/home/presentation/manager/fratured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: kPrimaryColor,
      surfaceTintColor: kPrimaryColor,
      shadowColor: Colors.black,
      leadingWidth: 80,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 30),
          child: IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kSearchRoute);
            },
            icon: const Icon(FontAwesomeIcons.magnifyingGlass),
          ),
        ),
      ],
      expandedHeight: 100,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        title: Image.asset(
          AssetsData.logo,
          height: 18,
        ),
        centerTitle: true,
      ),
    );
  }
}
