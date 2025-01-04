import 'package:flutter/material.dart';

class TiltleSubtitleWidget extends StatelessWidget {
  const TiltleSubtitleWidget(
      {super.key, required this.title, required this.subHeading});

  final String title;
  final String subHeading;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              letterSpacing: 0,
             // height: 27,
              fontWeight: FontWeight.w900,
              fontFamily: 'Times New Roman',
               color: Color.fromRGBO(255,255 , 255, 1),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            subHeading,
            style: const TextStyle(
              fontSize: 16,
              height: 1.86,
              fontWeight: FontWeight.w300,
              fontFamily: 'Times New Roman',
              color: Color.fromRGBO(255, 255, 255,1),
            ),
          ),
        ],
      ),
    );
  }
}
