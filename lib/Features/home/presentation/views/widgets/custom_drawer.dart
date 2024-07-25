import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kPrimaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
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
          const Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: Opacity(
              opacity: 0.2,
              child: Text(
                'Powered by Madlerz',
                style: Styles.textStyle18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
