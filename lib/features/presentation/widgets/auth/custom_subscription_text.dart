import 'package:flutter/material.dart';

class CustomSubscriptionText extends StatelessWidget {

  final Function()? onPress;

  const CustomSubscriptionText({
    super.key, 
    this.onPress
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress, 
      child: Text('Suscribirse', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, decoration: TextDecoration.underline, decorationColor: Colors.red,),)
    );
  }
}