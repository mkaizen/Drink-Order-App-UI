import 'package:drink_order_app_ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:drink_order_app_ui/provider/products_provider.dart';
import 'package:drink_order_app_ui/provider/user_provider.dart';
import 'package:drink_order_app_ui/screens/login1.dart';
import 'package:drink_order_app_ui/widgets/loading.dart';
import 'package:provider/provider.dart';
void main() {
   WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserProvider.initialize()),
        ChangeNotifierProvider.value(value: ProductsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.green),
        home: ScreensController(),
      )));
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);

    switch (user.status) {
      case Status.Uninitialized:
        return Loading();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return LoginOne();
      case Status.Authenticated:
        return HomeScreen();
      default:
        return LoginOne();
    }
  }
}