import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key,
        this.buttonTitle,
      required this.onPressed,
      this.buttonBgColor,
       this.buttonWidth,
       this.buttonradius,
       this.buttonTextColor,
       this.buttonheight,
       this.buttonIcon});
  final Icon? buttonIcon;
  final void Function() onPressed;
  final Color? buttonBgColor;
  final double? buttonWidth;
  final double? buttonheight;
  final Color? buttonTextColor;
  final String? buttonTitle;
  final double? buttonradius;

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
          child: Text(
            buttonTitle!,
            style: TextStyle(
              color: buttonTextColor,
            ),
          ),
         
        ));
  }
}
