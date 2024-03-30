import 'package:flutter/material.dart';

class mytheame {
  static ThemeData lighttheame(BuildContext context) => ThemeData(
        primarySwatch: Colors.green,
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        textTheme: Theme.of(context).textTheme,
        useMaterial3: true,
      );

  static ThemeData darktheame(BuildContext context) =>
      ThemeData(brightness: Brightness.dark);
}
