import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drink_order_app_ui/models/products.dart';

class ProductsServices {
  String collection = "products";
  Firestore _firestore = Firestore.instance;

  Future<List<Products>> getProducts() async =>
      _firestore.collection(collection).getDocuments().then((result) {
        List<Products> productsList = [];
        print("=== RESULT SIZE ${result.documents.length}");
        for (DocumentSnapshot item in result.documents) {
          productsList.add(Products.fromSnapshot(item));
          print(item["name"]);
          print(item["image"]);
          print(" PRODUCTSSSS ${productsList.length}");
        }

        return productsList;
      });
}
