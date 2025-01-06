import 'package:flutter/material.dart';
import 'package:food_delivery_app/routes/routes_constants.dart';
import 'package:food_delivery_app/widgets/show_dialog_widget.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return ShowDialogWidget(
      hintText: "Enter your email address",
      title: "Forgot Password",
      buttonText: "Reset Password",
      onButtonPressed: () {
        Navigator.popAndPushNamed(context, RoutesConstants.otp);
      },
    );
  }
}
