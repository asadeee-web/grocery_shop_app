import 'package:flutter/material.dart';

class Item {
  final String name;
  final String image;
  final double price;
  final Color color;
  bool itemAdded;

  Item({
    required this.name,
    required this.image,
    required this.price,
    required this.color,
    required this.itemAdded,
  });
}
