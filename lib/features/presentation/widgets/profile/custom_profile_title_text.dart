import 'package:flutter/material.dart';

class CustomProfileTitleText extends StatelessWidget {

  final String text;

  const CustomProfileTitleText({
    super.key, 
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: 26),);
  }
}