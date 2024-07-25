import 'package:bookly_app/Features/home/presentation/manager/fratured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_sliver_app_bar.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/featured_books_list_view.dart';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks();
        BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooks();
      },
      child: const CustomScrollView(slivers: [
        //SliverToBoxAdapter(child: SizedBox(height: 20)),
        CustomSliverAppBar(),
        SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CustomAppBar(),
              FeaturedBooksListView(),
              SizedBox(height: 49),
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  'Newest Books',
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: NewestBooksListView(),
          ),
        )
      ]),
    );
  }
}
