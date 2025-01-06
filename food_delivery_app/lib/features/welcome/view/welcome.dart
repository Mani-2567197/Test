import 'package:flutter/material.dart';
import 'package:food_delivery_app/routes/routes_constants.dart';
import 'package:food_delivery_app/utils/image_constants.dart';
import 'package:food_delivery_app/widgets/button_widget.dart';
import 'package:food_delivery_app/widgets/logo_widget.dart';
import 'package:food_delivery_app/widgets/tiltle_subtitle_widget.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
        height: double.infinity,
         decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.white, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
        child: Column(
            children: [
              LogoWidget(image: ImageConstants.logo,width: 168, height: 220, left: 103),
              const SizedBox(
                height: 50,
              ),
              
              Padding(
                padding: const EdgeInsets.all(14),
                child: const TiltleSubtitleWidget(title: 'Welcome to WaraChow', subHeading: 'Order the best meals in Lagos and have them delivered to your doorstep in little or no time. Doesn’t that sound delicious???',
          ),
              ),
              ButtonWidget(buttonIcon: const Icon(Icons.arrow_forward,weight: 20,), onPressed: () {
                Navigator.pushNamed(context,RoutesConstants.loginScreen);
              }, buttonBgColor: Colors.white, buttonWidth: 220, buttonheight: 50, buttonTextColor: Colors.grey,),
            ],
          ),
      ),
    );
  }
}
