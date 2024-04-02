import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:installitaion_class_datatype_variable_theme_route/models/model.dart';

class Itemview extends StatelessWidget {
  
  final Model model;

  const Itemview({super.key, required this.model});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(model.id.toString()),
      title: Text(model.name),
      subtitle: Text(model.price.toString()),
      trailing: Image.network(model.image),
    );
  }
}
