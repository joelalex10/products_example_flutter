import 'package:flutter/material.dart';
import 'package:productos/dto/product_dto.dart';

class ProductNotifier extends ChangeNotifier {
  ProductDto _product;

  ProductNotifier(this._product);

  ProductDto get product => _product;

  void updateAvailability(int isAvailable) {
    _product.isAvailable = isAvailable;
    notifyListeners();
  }
}
