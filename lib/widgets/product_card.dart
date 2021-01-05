import 'package:flutter/material.dart';
import 'package:drink_order_app_ui/provider/user_provider.dart';
import 'package:drink_order_app_ui/screens/purchase_successful.dart';
import 'package:drink_order_app_ui/services/functions.dart';
import 'package:drink_order_app_ui/services/stripe.dart';
import 'package:drink_order_app_ui/services/styles.dart';
import 'package:provider/provider.dart';

import 'custom_text.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String image;
  final String price;

  const ProductCard(
      {Key key, @required this.name, @required this.price, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: white,
            boxShadow: [
              BoxShadow(color: green[200], offset: Offset(2, 1), blurRadius: 5)
            ]),
        child: ListTile(
          onTap: () {
//            Navigator.pop(context);
          },
          leading: Image.network(
            '$image',
            width: 80,
            height: 80,
          ),
          title: Text(name),
          subtitle: Text("\$${price.toString()}"),
          trailing: GestureDetector(
            onTap: () {
              StripeServices stripeServices = StripeServices();
//              1000 is equal to $10.00
              stripeServices
                  .charge(
                      productName: name,
                      cardId: user.userModel.activeCard,
                      userId: user.user.uid,
                      customer: user.userModel.stripeId,
                      amount: 1000)
                  .then((value) {
                user.loadCardsAndPurchase(userId: user.user.uid);
                if (value) {
                  changeScreen(context, Success());
                } else {
                  print("we have a payment error");
                  print("we have a payment error");
                  print("we have a payment error");

//                  _key.currentState.showSnackBar(
//                      SnackBar(content: Text("Payment failed")));
                }
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: green),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                child: CustomText(
                  msg: "Buy",
                  color: white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
