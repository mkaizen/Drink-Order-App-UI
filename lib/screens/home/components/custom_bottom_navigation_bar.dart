import 'package:drink_order_app_ui/constants/constants.dart';
import 'package:drink_order_app_ui/constants/custom_icons_icons.dart';
import 'package:drink_order_app_ui/screens/home/components/bottom_bar.dart';
import 'package:drink_order_app_ui/screens/home/home_screen.dart';
import 'package:drink_order_app_ui/services/functions.dart';
import 'package:drink_order_app_ui/screens/products.dart';
import 'package:flutter/material.dart';
import 'package:drink_order_app_ui/provider/products_provider.dart';
import 'package:drink_order_app_ui/provider/user_provider.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int bottomNavigationBaritemIndex = 0;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    final products = Provider.of<ProductsProvider>(context);
    return Container(
      decoration: BoxDecoration(
          color: black.withOpacity(0.5),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30.0),
          )),
      padding: EdgeInsets.only(
          left: appPadding,
          right: appPadding,
          bottom: appPadding / 2,
          top: appPadding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BottomBar(
            onPressed: () {
              setState(() {
                changeScreen(context, HomeScreen());
                bottomNavigationBaritemIndex = 0;
              });
            },
            bottomIcons: bottomNavigationBaritemIndex == 0 ? true : false,
            icons: CustomIcons.home,
            text: "Home",
          ),
          BottomBar(
            onPressed: () {
              setState(() {
                changeScreen(context, ProductsScreen());
                bottomNavigationBaritemIndex = 1;
              });
            },
            bottomIcons: bottomNavigationBaritemIndex == 1 ? true : false,
            icons: CustomIcons.wine_menu,
            text: "Menu",
          ),
          BottomBar(
            onPressed: () {
              setState(() {
                bottomNavigationBaritemIndex = 2;
              });
            },
            bottomIcons: bottomNavigationBaritemIndex == 2 ? true : false,
            icons: CustomIcons.search,
            text: "Search",
          ),
        ],
      ),
    );
  }
}
