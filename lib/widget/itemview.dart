import 'package:flutter/material.dart';
import 'package:installitaion_class_datatype_variable_theme_route/models/model.dart';

class Itemview extends StatelessWidget {
  final Item item;

  const Itemview({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        item.id.toString(),
      ),
      title: Text(item.name),
      subtitle: Text(
        item.price.toString(),
      ),
      trailing: Image.network(item.image),
    );
  }
}
