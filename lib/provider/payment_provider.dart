//import 'package:flutter/material.dart';
//import 'package:stripe_payment/stripe_payment.dart';

//class PaymentProvider with ChangeNotifier {
// GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
// PaymentMethod _paymentMethod = PaymentMethod();

// PaymentProvider.initialize() {
//   StripePayment.setOptions(StripeOptions(
//        publishableKey: "pk_test_zez07UZKkeT7mWvo2aD7dZJi009OCT6Nsk"));
//  }

// void addCard() {
//  StripePayment.paymentRequestWithCardForm(CardFormPaymentRequest())
//      .then((paymentMethod) {
//    _paymentMethod = paymentMethod;
//     print(
//         "The payment method id is ${paymentMethod.id} ==================================");
//
//     print("There was an error: ${err.toString()}");
//   });
// }
//}
