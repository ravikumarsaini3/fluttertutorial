import 'package:flutter/material.dart';
import 'package:installitaion_class_datatype_variable_theme_route/models/model.dart';

class Home_details extends StatelessWidget {
  final Item catalog;

  const Home_details({super.key, required this.catalog});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        elevation: 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Hero(
                    tag: Key(catalog.id.toString()),
                    child: Container(
                      height: 200,
                      width: 500,
                      child: Image.network(catalog.image),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                catalog.name,
                style: const TextStyle(
                    color: Colors.green,
                    fontSize: 17,
                    fontWeight: FontWeight.w800),
              ),
            ),
            const Text(
              'The new iPhone 14 is the best phone on the market.\n It has a sleek new design, a powerful new processor, and an amazing new camera system. \nThe iPhone 14 is also water resistant and dust proof,\n so you can take it with you wherever you go.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonBar(
              buttonPadding: const EdgeInsets.all(20),
              alignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "\$${catalog.price.toString()}",
                    style: const TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'ADD TO CART',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w800),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
