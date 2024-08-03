import 'package:flutter/material.dart';
import 'package:productos/pages/insert_product_page.dart';
import 'package:productos/pages/tab_products_page.dart';

class AppRoutes{
  static String initialRoute = '/tab_list_products';
  static Map<String, Widget Function(BuildContext)> routes = {
    '/insert_product': (context) => InsertProductPage(),
    '/tab_list_products': (context) => TabProductsPage(),
  };
}