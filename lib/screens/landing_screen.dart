import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:grocery_shop_app/components/custom_button.dart';
import 'package:grocery_shop_app/screens/home_screen.dart';
import 'package:grocery_shop_app/utils/colors.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "assets/landing_image.png",
                width: 400,
                height: 400,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "We Deliver Grocery At Your Door Step",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              "Groceer gives you fresh vegetables and fruits, Order fresh Items from groceer,",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            CustomButton(
              text: 'Get Started',
              onPressed: () {
                Get.offAll(HomeScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
