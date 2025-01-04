// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/logo_widget.dart';
import 'package:food_delivery_app/widgets/tiltle_subtitle_widget.dart';

class Welcome extends StatefulWidget {
  const Welcome({ super.key });

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromRGBO(255, 255, 255, 0), Color.fromARGB(4, 0, 0, 1)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        
        child:Column(
          children: [
               LogoWidget(height: 99,width: 168,top: 79,left: 103),
               TiltleSubtitleWidget(title: 'Welcome to WaraChow',subHeading: 'Order the best meals in Lagos and have them delivered to your doorstep in little or no time. Doesn’t that sound delicious???',)
          ],
        )  
        )
    );
  }
}