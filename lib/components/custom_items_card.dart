import 'package:flutter/material.dart';
import 'package:grocery_shop_app/utils/colors.dart';

class CustomItemsCard extends StatelessWidget {
  final Color color;
  final String name;
  final String image;
  final double price;
  final bool isAdded;
  final VoidCallback onPressed;
  const CustomItemsCard({
    super.key,
    required this.color,
    required this.image,
    required this.name,
    required this.price,
    required this.isAdded,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          //padding: EdgeInsets.all(10),
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(image, width: 100, height: 100),
              Text(name, style: TextStyle(fontSize: 14)),

              Text(
                "\$ ${price.toString()}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: onPressed,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.10),
                  blurRadius: 6,
                  offset: Offset(2, 2), // shadow direction: bottom-right
                ),
              ],
            ),
            child: Icon(isAdded ? Icons.done : Icons.add, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
