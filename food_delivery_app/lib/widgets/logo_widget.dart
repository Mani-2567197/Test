import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double left, width, height;
  final String image;
  const LogoWidget({
    super.key,
    required this.width,
    required this.height,
    required this.left,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      child: Image.asset(
        image,
        width: width,
        height: height,
      ),
    );
  }
}
