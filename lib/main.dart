import 'package:flutter/material.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:food_delivery/utils/app_theme.dart';
import 'package:food_delivery/views/pages/cart_page.dart';
import 'package:food_delivery/views/pages/coupons_page.dart';
import 'package:food_delivery/views/pages/custom_bottom_navbar.dart';
import 'package:food_delivery/views/pages/order_details_page.dart';
import 'package:food_delivery/views/pages/orders_page.dart';
import 'package:food_delivery/views/pages/product_details_page.dart';

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
      title: 'Food Delivery',
      theme: AppTheme.lightTheme(),
      home: const CustomBottomNavbar(),
      routes: {
        ProductDetailsPage.routeName: (context) => const ProductDetailsPage(),
        CartPage.routeName: (context) => const CartPage(),
        OrdersPage.routeName: (context) => const OrdersPage(),
        OrderDetailsPage.routeName: (context) => const OrderDetailsPage(),
        CouponsPage.routeName: (context) => const CouponsPage(),
      },
    );
  }
}
