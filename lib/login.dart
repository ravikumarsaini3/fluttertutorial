import 'package:flutter/material.dart';

import 'package:installitaion_class_datatype_variable_theme_route/home.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: RichText(
            text: const TextSpan(children: [
              TextSpan(
                text: ' Welcome ',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              TextSpan(text: ' to the '),
              TextSpan(
                text: ' Login ',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              TextSpan(
                text: ' Page ',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ]),
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
              Text(
                'Welcome $name',
                style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                autocorrect: true,
                enabled: true,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.email),
                  suffixIconColor: Colors.blue,
                  hintText: 'enter your email',
                  hintStyle: TextStyle(color: Colors.green),
                  labelText: 'email',
                  labelStyle: TextStyle(color: Colors.brown),
                ),
                onChanged: (value) {
                  name = value;
                  setState(() {});
                },
              ),
              const TextField(
                obscureText: true,
                autocorrect: true,
                enabled: true,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.lock),
                  suffixIconColor: Colors.red,
                  hintText: 'enter your password',
                  labelStyle: TextStyle(color: Colors.brown),
                  hintStyle: TextStyle(color: Colors.red),
                  labelText: 'password',
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
