import 'package:flutter/material.dart';
import 'package:food_delivery_app/routes/routes_constants.dart';
import 'package:food_delivery_app/utils/image_constants.dart';
import 'package:food_delivery_app/widgets/button_widget.dart';
import 'package:food_delivery_app/widgets/input_text_form_field_widget.dart';
import 'package:food_delivery_app/widgets/logo_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            const Color.fromARGB(255, 251, 237, 234),
            const Color.fromARGB(255, 255, 253, 253)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Column(children: [
          LogoWidget(
            width: 227,
            height: 134,
            left: 74,
            image: ImageConstants.logo,
          ),
          const SizedBox(height: 30),
          InputTextFormFieldWidget(
            hintText: "Email",
            textEditingController: _emailTextController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          const SizedBox(height: 40),
          InputTextFormFieldWidget(
            hintText: "Password",
            textEditingController: _passwordTextController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters long';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          ButtonWidget(
            buttonTitle: "Forgot Password?",
            onPressed: () {
              Navigator.popAndPushNamed(context, RoutesConstants.forgot);
            },
            buttonTextColor: Colors.black,
          ),
          const SizedBox(height: 20),
          ButtonWidget(
            buttonTitle: "Eat Away!",
            onPressed: () {},
            buttonTextColor: Colors.black,
            buttonBgColor: Colors.deepOrangeAccent,
            buttonWidth: 217,
            buttonheight: 39,
            buttonradius: 33,
          ),
          const SizedBox(height: 20),
          ButtonWidget(
              buttonTitle: "Sign in with",
              onPressed: () {},
              buttonTextColor: Colors.black),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LogoWidget(
                  image: ImageConstants.fbook,
                  width: 30,
                  height: 30,
                  left: 253),
              const SizedBox(width: 15),
              LogoWidget(
                  image: ImageConstants.google,
                  width: 30,
                  height: 30,
                  left: 199),
            ],
          ),
          const SizedBox(height: 110),
          ButtonWidget(
            buttonTitle: "Sign Up",
            onPressed: () {
              userAction();
            },
            buttonBgColor: Colors.deepOrangeAccent,
            buttonTextColor: Colors.black,
            buttonWidth: 330,
            buttonheight: 68,
            buttonradius: 33,
          )
        ]),
      ),
    );
  }

  void userAction() {
    final String email = _emailTextController.text;
    final String password = _passwordTextController.text;
    if (email == "a@gmail.com" && password == "123456") {
      Navigator.pushNamed(context, RoutesConstants.home);
    }
  }
}
