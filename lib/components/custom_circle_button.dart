import 'package:flutter/material.dart';
import 'package:grocery_shop_app/utils/colors.dart';

class CustomCircleButton extends StatelessWidget {
  final IconData icon;
  final double width;
  final double height;
  final VoidCallback onTap;
  final double blurRadius;
  final Color color;
  final Color iconColor;
  final double iconSize;

  const CustomCircleButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.width = 50,
    this.height = 50,
    this.blurRadius = 4,
    this.iconSize = 25,
    this.color = AppColors.secondaryColor,
    this.iconColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: blurRadius,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Icon(icon, color: iconColor, size: iconSize),
      ),
    );
  }
}
