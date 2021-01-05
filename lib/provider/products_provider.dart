import 'package:flutter/material.dart';
import 'package:drink_order_app_ui/models/products.dart';
import 'package:drink_order_app_ui/services/products.dart';

class ProductsProvider with ChangeNotifier {
  List<Products> productsList = [];
  ProductsServices _productsServices = ProductsServices();

  ProductsProvider() {
    loadProducts();
  }
  Future loadProducts() async {
    productsList = await _productsServices.getProducts();
    notifyListeners();
  }
}
