import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key,
      required this.buttonTitle,
      required this.onPressed,
      required this.buttonBgColor,
      required this.buttonWidth,
      required this.buttonTextColor,
      required this.buttonheight});
  final Icon buttonTitle;
  final void Function() onPressed;
  final Color buttonBgColor;
  final double buttonWidth;
  final double buttonheight;
  final Color buttonTextColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: buttonWidth,
        height: buttonheight,
        child: ElevatedButton(
          onPressed: (){},
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonBgColor,
          ),
          child: buttonTitle,
        ));
  }
}
