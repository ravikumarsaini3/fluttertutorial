import 'package:flutter/material.dart';
import 'package:installitaion_class_datatype_variable_theme_route/home.dart';
import 'package:installitaion_class_datatype_variable_theme_route/login.dart';

import 'package:installitaion_class_datatype_variable_theme_route/theams.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      title: 'Flutter Demo',
      theme: mytheame.lighttheame(context),
      darkTheme: mytheame.darktheame(context),
      initialRoute: "/home",
      routes: {
        "/": (context) => const Loginpage(),
        "/home": (context) => const Homepage(),
      },
    );
  }
}
