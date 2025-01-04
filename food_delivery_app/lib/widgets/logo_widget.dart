import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/image_constants.dart';

class LogoWidget extends StatelessWidget {
  final double left, width, height;
  const LogoWidget({
    super.key,
    required this.width,
    required this.height,
    required this.left
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      child: Image.asset(
        ImageConstants.logo,
        width: width,
        height: height,
      ),
    );
  }
}
