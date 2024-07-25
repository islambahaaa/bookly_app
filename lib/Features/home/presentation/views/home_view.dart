import 'package:bookly_app/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: CustomDrawer(),
      body: SafeArea(child: HomeViewBody()),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kPrimaryColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Center(
              child: Image.asset(
                AssetsData.logo,
                height: 100,
                width: 100,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
              size: 30,
            ),
            title: const Text(
              'H O M E',
              style: Styles.textStyle18,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.favorite,
              size: 30,
            ),
            title: const Text(
              'F A V O U R I T E S',
              style: Styles.textStyle18,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
