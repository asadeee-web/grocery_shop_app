import 'package:flutter/material.dart';
import 'package:grocery_shop_app/models/items.dart';

class HomeProvider extends ChangeNotifier {
  List<Item> cartItems = [];
  List<Item> itmes = [
    Item(
      name: "Vegitables",
      image: "assets/vegitables.png",
      price: 12,
      color: Color(0xffFFF0DA),
      itemAdded: false,
    ),
    Item(
      name: "Fruits",
      image: "assets/fruits.png",
      price: 10,
      color: Color(0xffEFFFDF),
      itemAdded: false,
    ),
    Item(
      name: "Meat",
      image: "assets/meat.png",
      price: 30,
      color: Color(0xffFFEAE6),
      itemAdded: false,
    ),
    Item(
      name: "Eggs",
      image: "assets/eggs.png",
      price: 50,
      color: Color.fromARGB(255, 219, 199, 175),
      itemAdded: false,
    ),
  ];
  void toggleItem(int index) {
    itmes[index].itemAdded = !itmes[index].itemAdded;
    updateCart(index);
    notifyListeners();
  }

  void updateCart(int index) {
    final item = itmes[index];

    if (item.itemAdded) {
      if (!cartItems.contains(item)) {
        cartItems.add(item);
      }
    } else {
      cartItems.remove(item);
    }

    print("Cart Items Count: ${cartItems.length}");
  }

  String getGreetingMessage() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return "Good Morning";
    } else if (hour < 17) {
      return "Good Afternoon";
    } else {
      return "Good Evening";
    }
  }
}
