import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:installitaion_class_datatype_variable_theme_route/models/cart_model.dart';
import 'package:installitaion_class_datatype_variable_theme_route/widget/cart.dart';
import 'package:installitaion_class_datatype_variable_theme_route/widget/home_details.dart';

import 'package:installitaion_class_datatype_variable_theme_route/models/model.dart';
import 'package:installitaion_class_datatype_variable_theme_route/widget/drawer.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();

    loadjson();
  }

  void loadjson() async {
    Future.delayed(const Duration(seconds: 2));
    final catalogjson =
        await rootBundle.loadString("assets/files/product.json");
    final decodedata = jsonDecode(catalogjson);
    var productdata = decodedata["products"];
    catalogModel.items =
        List.from(productdata).map<Item>((item) => Item.fromMap(item)).toList();
    // print(productdata);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //  final dummylist = List.generate(30, (index) => itemmodel.items[0]);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return cart();
              },
            ));
          },
          child: Icon(Icons.card_travel_outlined),
          backgroundColor: Colors.brown.shade300,
        ),
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text(
              ' Home Screen ',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )),
        drawer: drawer(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            catalogheader(),
            if (catalogModel.items.isNotEmpty)
              const Expanded(child: CatalogList())
            else
              CircularProgressIndicator()
          ],
        )

        /*(catalogModel.items.isNotEmpty)
            ? GridView.builder(
                itemCount: catalogModel.items.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    childAspectRatio: 1,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final item = catalogModel.items[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: GridTile(
                        child: Image.network(item.image),
                        header: Text(item.name),
                        footer: Text("\$${item.price.toString()}"),
                      ),
                    ),
                  );
                },
              )
            : const Center(
                child: CircularProgressIndicator(),
              )*/

        );
  }
}

class catalogheader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Catalog App',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
          ),
          Text(
            'Trending product ',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),
          ),
        ],
      ),
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: catalogModel.items.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final catalog = catalogModel.items[index];
        return Hero(
          tag: Key(catalog.id.toString()),
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Home_details(
                    catalog: catalog,
                  );
                },
              ));
            },
            child: CatalogItem(
              catalog: catalog,
            ),
          ),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Card(
        shadowColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: SizedBox(
          height: 130,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.network(
                  catalog.image,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          catalog.name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ButtonBar(
                          children: [
                            Text(
                              "\$${catalog.price.toString()}",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            addtocart(catalog: catalog),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class addtocart extends StatefulWidget {
  final Item catalog;
  const addtocart({
    super.key,
    required this.catalog,
  });

  @override
  State<addtocart> createState() => _addtocartState();
}

class _addtocartState extends State<addtocart> {
  var istrue = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          istrue = true;

          final _cart = cartmodel();
          final _catalog = catalogModel();
          _cart.catalog = _catalog;
          _cart.additem(widget.catalog);
          setState(() {});
        },
        style: ElevatedButton.styleFrom(
            elevation: 2, backgroundColor: Colors.blueGrey.shade100),
        child: istrue
            ? Icon(Icons.done)
            : const Text(
                'ADD TO CART',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ));
  }
}

class _addtocart extends StatelessWidget {
  const _addtocart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            elevation: 2, backgroundColor: Colors.blueGrey.shade100),
        child: const Text(
          'ADD TO CART',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
        ));
  }
}
