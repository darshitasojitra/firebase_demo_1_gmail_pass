import 'dart:developer';
import 'package:firebase_demo_1/auth.dart';
import 'package:flutter/material.dart';
import 'loginscreen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _auth=Authservice();
  TextEditingController _name=TextEditingController();
  TextEditingController _email=TextEditingController();
  TextEditingController _password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('signup'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _name,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.person),
                hintText: 'name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _email,
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.email),
                  hintText: 'email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _password,
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.password),
                  hintText: 'password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
            ),
          ),
          ElevatedButton(onPressed:_signup, child: Text('signup')),
          InkWell(onTap:(){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginscreen()));
          },child: Text('login',style: TextStyle(color: Colors.red,fontSize: 25),))
        ],
      ),
    );
  }
  _signup()async{
    final user=await _auth.createUserWithEmailAndPassword(_email.text, _password.text);
    if(user!=null){
      log('user creadte successfully');
    }
  }
}
