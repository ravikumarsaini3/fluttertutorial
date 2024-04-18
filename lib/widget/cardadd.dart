import 'package:flutter/material.dart';
import 'package:installitaion_class_datatype_variable_theme_route/models/cart_model.dart';
import 'package:installitaion_class_datatype_variable_theme_route/models/model.dart';

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
  final _cart = cartmodel();

  @override
  Widget build(BuildContext context) {
    var isincart = _cart.items.contains(widget.catalog);
    return ElevatedButton(
        onPressed: () {
          if (!isincart) {
            isincart = true;

            final _catalog = catalogModel();
            _cart.catalog = _catalog;
            _cart.additem(widget.catalog);
            setState(() {});
          }
        },
        style: ElevatedButton.styleFrom(
            elevation: 2, backgroundColor: Colors.blueGrey.shade100),
        child: isincart ? Icon(Icons.done) : Icon(Icons.add_shopping_cart));
  }
}
