import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Day1 ||Day 2|| Day 3',
        style: TextStyle(
            color: Colors.blue, fontSize: 25, fontWeight: FontWeight.bold),
      )),
      body: const Center(
          child: Text(
        'Welcome To The Login Page',
        style: TextStyle(
            color: Colors.blue, fontSize: 25, fontWeight: FontWeight.bold),
      )),
    );
  }
}
