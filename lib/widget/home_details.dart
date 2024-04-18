import 'package:flutter/material.dart';
import 'package:installitaion_class_datatype_variable_theme_route/models/model.dart';
import 'package:installitaion_class_datatype_variable_theme_route/widget/cardadd.dart';

// ignore: camel_case_types
class Home_details extends StatefulWidget {
  final Item catalog;

  const Home_details({super.key, required this.catalog});

  @override
  State<Home_details> createState() => _Home_detailsState();
}

class _Home_detailsState extends State<Home_details> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.exit_to_app))
          ],
        ),
        body: Card(
          elevation: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Hero(
                      tag: Key(widget.catalog.id.toString()),
                      child: Container(
                        height: 200,
                        width: 500,
                        child: Image.network(widget.catalog.image),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.catalog.name,
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
                      "\$${widget.catalog.price.toString()}",
                      style: const TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ),
                  addtocart(catalog: widget.catalog)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
