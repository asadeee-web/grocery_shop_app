import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:grocery_shop_app/components/custom_items_card.dart';
import 'package:grocery_shop_app/providers/home_provider.dart';
import 'package:grocery_shop_app/screens/cart_screen.dart';
import 'package:grocery_shop_app/utils/colors.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: Consumer<HomeProvider>(
        builder: (context, model, child) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_pin),
                          Text("Peshawar Pakistan ,KPK"),
                        ],
                      ),

                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/profile.PNG"),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Text(
                    "${model.getGreetingMessage()}, Mate",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    "Lets order fresh items for you",

                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 40),
                  Text(
                    "Categories",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Expanded(
                    child: GridView.builder(
                      //shrinkWrap: true,
                      itemCount: model.itmes.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                      ),
                      itemBuilder: (context, index) {
                        final item = model.itmes[index];
                        return CustomItemsCard(
                          color: item.color,
                          name: item.name,
                          image: item.image,
                          isAdded: item.itemAdded,
                          onPressed: () {
                            model.toggleItem(index);
                          },
                          price: item.price,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Get.to(
                  () => CartScreen(
                    cartItems: model.cartItems,
                    onItemRemoved: (removedItem) {
                      final index = model.itmes.indexOf(removedItem);
                      if (index != -1) {
                        model.itmes[index].itemAdded = false;
                        model.cartItems.remove(removedItem);
                      }
                    },
                  ),
                );
              },
              child: Icon(Icons.shopping_cart),
            ),
          );
        },
      ),
    );
  }
}
