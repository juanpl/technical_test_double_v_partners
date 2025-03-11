import 'package:flutter/material.dart';

class CustomProfileSubtitleText extends StatelessWidget {

  final String text;

  const CustomProfileSubtitleText({
    super.key, 
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: 20),);
  }
}