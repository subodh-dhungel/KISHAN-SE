import 'package:flutter/material.dart';
import 'package:kishan_se/helperFunctions/products.dart';

class Cart extends ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => _items;

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    _items.remove(product);
    notifyListeners();
  }

  double get totalPrice {
    return _items.fold(0, (sum, item) {
      String cleanedPrice = item.price.replaceAll(RegExp(r'[^\d.]'), '');
      return sum + double.parse(cleanedPrice);
    });
  }
}
