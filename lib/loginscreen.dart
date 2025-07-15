import 'dart:developer';

import 'package:firebase_demo_1/signup_screen.dart';
import 'package:flutter/material.dart';

import 'abc.dart';
import 'auth.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final _auth = Authservice();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: _email,
                decoration: InputDecoration(
                    hintText: 'Enter Email',
                    suffixIcon: Icon(Icons.email),
                    border: OutlineInputBorder()),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: _password,
                decoration: InputDecoration(
                    hintText: 'Enter password',
                    suffixIcon: Icon(Icons.password),
                    border: OutlineInputBorder()),
              ),
            ),
          ),
          OutlinedButton(
              onPressed: _login,
              child: Text('Login')),
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignupScreen()));
              },
              child: Text(
                "Signup",
                style: TextStyle(color: Colors.red),
              )),
        ],
      ),
    );
  }

  _login() async {
    final user =
        await _auth.loginUserWithEmailPassword(_email.text, _password.text);
    if (user != null) {
      log('user logged in');
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Abc()));
    }
  }
}
