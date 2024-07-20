import 'package:bookly_app/Features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        BlocProvider.of<SearchCubit>(context)
            .fetchSearchedBooks(searchBook: value);
      },
      decoration: InputDecoration(
        hintText: 'Search',
        suffixIcon: Opacity(
          opacity: 0.8,
          child: IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.magnifyingGlass)),
        ),
        enabledBorder: borderBuildMethod(),
        focusedBorder: borderBuildMethod(),
      ),
    );
  }

  OutlineInputBorder borderBuildMethod() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        color: Colors.white,
      ),
    );
  }
}
