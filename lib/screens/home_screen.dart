import 'package:flutter/material.dart';
import 'package:grocery_shop_app/providers/home_provider.dart';
import 'package:grocery_shop_app/utils/colors.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => HomeProvider(),
        child: Consumer<HomeProvider>(
          builder: (context, model, child) {
            return Padding(
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
                  Text("Categories"),
                  Expanded(
                    child: GridView.builder(
                      //shrinkWrap: true,
                      itemCount: 4,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                      ),
                      itemBuilder: (context, index) {
                        return Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Container(
                              //padding: EdgeInsets.all(10),
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: model.itmes[index].color,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    model.itmes[index].image,
                                    width: 100,
                                    height: 100,
                                  ),
                                  Text(
                                    model.itmes[index].name,
                                    style: TextStyle(fontSize: 14),
                                  ),

                                  Text(
                                    "\$ ${model.itmes[index].price.toString()}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                model.toggleItem(index);
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  model.itmes[index].itemAdded
                                      ? Icons.done
                                      : Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
