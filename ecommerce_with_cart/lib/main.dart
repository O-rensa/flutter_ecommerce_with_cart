import 'package:ecommerce_with_cart/pages/cart_page.dart';
import 'package:ecommerce_with_cart/pages/intro_page.dart';
import 'package:ecommerce_with_cart/pages/shop_page.dart';
import 'package:ecommerce_with_cart/themes/light_mode.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      theme: lightMode,

      // routes
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/shop_page': (context) => const ShopPage(),
        '/cart_page': (context) => const CartPage(),
      },


    );
  }
}
