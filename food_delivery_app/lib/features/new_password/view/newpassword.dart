import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/image_constants.dart';
import 'package:food_delivery_app/widgets/button_widget.dart';
import 'package:food_delivery_app/widgets/input_text_form_field_widget.dart';
import 'package:food_delivery_app/widgets/logo_widget.dart';

class Newpassword extends StatefulWidget {
  const Newpassword({ Key? key }) : super(key: key);

  @override
  _NewpasswordState createState() => _NewpasswordState();
}

class _NewpasswordState extends State<Newpassword> {
  TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromARGB(255, 251, 237, 234), const Color.fromARGB(255, 255, 253,253)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
        ),
        child: Column(
          children: [
              LogoWidget(width: 227, height: 134, left: 74, image:ImageConstants.logo,),
              const SizedBox(height: 30),
              Text("Your password must be at-least 8 characters long",
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize:18,
                fontFamily: "Times New Roman",
              ),),
              const SizedBox(height: 50),
             InputTextFormFieldWidget(hintText: "Enter new password", textEditingController: _passwordTextController,),
             const SizedBox(height: 40),
             InputTextFormFieldWidget(hintText: "Reconfirm new password", textEditingController: _passwordTextController,),
             const SizedBox(height: 110),
             ButtonWidget(onPressed: (){

             },buttonBgColor: Colors.deepOrangeAccent,buttonTextColor: Colors.white,buttonradius: 33,buttonTitle: "Eat Away!",buttonWidth: 216,buttonheight: 39,)

          ],
        ),),
    );
  }
}