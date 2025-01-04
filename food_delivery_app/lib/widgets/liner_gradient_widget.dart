import 'package:flutter/material.dart';

class LinerGradientWidget extends StatelessWidget {
  const LinerGradientWidget({super.key, 
  required this.colors, 
  required this.color1, required this.color2});
  final List<Color> colors;
  final Color color1;
  final Color color2;
  @override
  Widget build(BuildContext context) {
    return Container(
       width: double.infinity,
        height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [color1, color2],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
    );
  }
}
