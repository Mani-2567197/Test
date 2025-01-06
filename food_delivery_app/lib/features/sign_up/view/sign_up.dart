import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/color_constants.dart';
import 'package:food_delivery_app/widgets/input_text_form_field_widget.dart';
import 'package:food_delivery_app/widgets/social_media_icon.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController namecontroller = TextEditingController();
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    TextEditingController confirmpasswordcontroller = TextEditingController();
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 100), // Adjust as per UI spacing
            Center(
              child: Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color:Color(0xFFFF5722)
                )
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  InputTextFormFieldWidget(hintText: "Name",textEditingController:  namecontroller,),
                  const SizedBox(height: 16),
                   InputTextFormFieldWidget(hintText: "Email",textEditingController: emailcontroller,),
                  const SizedBox(height: 16),
                   InputTextFormFieldWidget(hintText: "Password", obscureText: true,textEditingController: passwordcontroller,),
                  const SizedBox(height: 16),
                   InputTextFormFieldWidget(hintText: "Confirm Password", obscureText: true,textEditingController: confirmpasswordcontroller,),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      // Handle sign-up logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF5722),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    ),
                    child: Text(
                      "Never Hungry Again!",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                       color: Colors.white,
                    ),
                  ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "or Sign Up with",
                    style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFFB0B0B0),
                  ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SocialMediaIcon(
                        icon: Icons.facebook,
                        color:Color(0xFF4267B2)
                      ),
                      SizedBox(width: 16),
                      SocialMediaIcon(
                        icon: Icons.email,
                        color: Color(0xFFE53935),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
