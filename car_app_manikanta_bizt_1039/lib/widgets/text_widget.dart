import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
   required this.fieldname
  });
  final String fieldname;
  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(fieldname,
          style: TextStyle(
            fontWeight: FontWeight.w800
          ),)
        ],
    );
  }
}