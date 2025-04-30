import 'package:flutter/material.dart';
import 'package:grocery_shop_app/models/items.dart';

class CartProvider extends ChangeNotifier {
  List<Item> cartItem = [];
  //int? totalAmonnt;

  CartProvider(this.cartItem);

  removeItem(int index) {
    cartItem.removeAt(index);
    notifyListeners();
  }

  double get totalAmount {
    double total = 0.0;
    for (var item in cartItem) {
      total += item.price;
    }
    return total;
  }
}
