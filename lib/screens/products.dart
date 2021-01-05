import 'package:flutter/material.dart';
import 'package:drink_order_app_ui/constants/constants.dart';
import 'package:drink_order_app_ui/provider/products_provider.dart';
import 'package:drink_order_app_ui/provider/user_provider.dart';
import 'package:drink_order_app_ui/services/styles.dart';
import 'package:drink_order_app_ui/widgets/product_card.dart';
import 'package:drink_order_app_ui/screens/home/components/categories.dart';
import 'package:drink_order_app_ui/screens/home/components/custom_app_bar.dart';
import 'package:drink_order_app_ui/screens/home/components/custom_bottom_navigation_bar.dart';
import 'package:drink_order_app_ui/screens/home/components/drink_products.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final user = Provider.of<UserProvider>(context);

    return Scaffold(
      backgroundColor: grey_dark,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomAppBar(),
          Categories(),
          Container(
              color: grey_dark,
              child: Container(
                  height: size.height * 0.55,
                  child: ListView.builder(
                      itemCount: products.productsList.length,
                      itemBuilder: (_, index) {
                        return ProductCard(
                            image: products.productsList[index].image,
                            name: products.productsList[index].name,
                            price: products.productsList[index].price);
                      }))),
          CustomBottomNavigationBar(),
        ],
      ),
    );
  }
}
