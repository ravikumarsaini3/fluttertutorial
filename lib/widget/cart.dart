import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:installitaion_class_datatype_variable_theme_route/models/cart_model.dart';

class cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CART',
          style: TextStyle(
              color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [Expanded(child: listitem()), const Divider(), _cardtotal()],
      ),
    );
  }
}

class _cardtotal extends StatelessWidget {
  final _cart = cartmodel();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            '\$${_cart.totalPrice}',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          SizedBox(
            width: 100,
            child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                        "BUY not suported yet  try again after some time later "),
                  ));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    elevation: 5,
                    foregroundColor: Colors.blueAccent,
                    shadowColor: Colors.green),
                child: const Text(
                  'BUY',
                  style: TextStyle(color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}

class listitem extends StatefulWidget {
  @override
  State<listitem> createState() => _listitemState();
}

class _listitemState extends State<listitem> {
  final _cart = cartmodel();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: _cart.items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.done),
            title: Text('${_cart.items[index].name}'),
            trailing: const Icon(Icons.minimize),
          );
        },
      ),
    );
  }
}
