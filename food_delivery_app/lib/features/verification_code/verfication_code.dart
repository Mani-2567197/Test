import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/show_dialog_widget.dart';

class VerficationCode extends StatefulWidget {
  const VerficationCode({ Key? key }) : super(key: key);

  @override
  _VerficationCodeState createState() => _VerficationCodeState();
}

class _VerficationCodeState extends State<VerficationCode> {
  @override
  Widget build(BuildContext context) {
    return ShowDialogWidget(
      hintText: "Verification Code",
      title: "Verification Code",
      buttonText: "Reset Password",
      onButtonPressed: () {
        
      },
      
    );
  }
}