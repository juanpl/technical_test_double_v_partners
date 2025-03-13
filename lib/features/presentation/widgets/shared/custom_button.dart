import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String text;
  final bool? enable;
  final Function()? onPress;

  const CustomButton({
    super.key, 
    required this.text, 
    this.enable=true, 
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: enable == true ? Colors.red : Colors.grey,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: enable == true ? onPress:null,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 200,
          height: 50,
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

}