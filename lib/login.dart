import 'package:flutter/material.dart';

import 'package:installitaion_class_datatype_variable_theme_route/home.dart';

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
      body: Center(
        child: SizedBox(
          width: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: Image.network(
                    fit: BoxFit.cover,
                    'https://media.istockphoto.com/id/1281150061/vector/register-account-submit-access-login-password-username-internet-online-website-concept.jpg?s=612x612&w=0&k=20&c=9HWSuA9IaU4o-CK6fALBS5eaO1ubnsM08EOYwgbwGBo='),
              ),
              const SizedBox(
                height: 10,
              ),
              const TextField(
                autocorrect: true,
                enabled: true,
                decoration: InputDecoration(
                  hintText: 'enter your email',
                  hintStyle: TextStyle(color: Colors.green),
                  labelText: 'email',
                  labelStyle: TextStyle(color: Colors.brown),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                          color: Colors.red, style: BorderStyle.solid)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const TextField(
                autocorrect: true,
                enabled: true,
                decoration: InputDecoration(
                  hintText: 'enter your password',
                  labelStyle: TextStyle(color: Colors.brown),
                  hintStyle: TextStyle(color: Colors.red),
                  labelText: 'password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                          color: Colors.green, style: BorderStyle.solid)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const Homepage();
                      },
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                      elevation: 10,
                      shadowColor: Colors.brown,
                      foregroundColor: Colors.tealAccent,
                      minimumSize: const Size(180, 40)),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
