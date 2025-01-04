import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({ Key? key }) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
          width: double.infinity,
        height: double.infinity,
         decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Color.fromARGB(0, 251, 237, 234), Color.fromARGB(0,255,253,253)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
        

      ),
      
    );
  }
}