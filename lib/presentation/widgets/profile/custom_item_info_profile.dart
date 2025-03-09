import 'package:flutter/material.dart';

class CustomItemInfoProfile extends StatelessWidget {

  final String text;
  final IconData icon;

  const CustomItemInfoProfile({
    super.key, 
    required this.text, 
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return 
    Row(children: [
      Icon(icon, size: 18,),
      SizedBox(width: 5),
      Text(text, style: TextStyle(fontSize: 18),)
    ],);
  }

}