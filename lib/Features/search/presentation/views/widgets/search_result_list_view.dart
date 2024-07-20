import 'package:bookly_app/Features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:bookly_app/Features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          print(state.books.length);
          return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BookListViewItem(
                    book: state.books[index],
                  ),
                );
              });
        } else if (state is SearchFailure) {
          if (state.errMessage == 'Missing query.') {
            return const CustomErrorWidget(errMessage: 'Start Searching');
          }
          return CustomErrorWidget(errMessage: state.errMessage);
        } else if (state is SearchInitial) {
          return const CustomErrorWidget(errMessage: 'Start Searching');
        } else {
          return const ShimmerNewestListView();
        }
      },
    );
  }
}
