import 'package:flutter/material.dart';

class CustomPushIcon extends StatelessWidget {

  final IconData? icon;
  final Function()? onPress;
  final Color? color;
  final bool? enable;

  const CustomPushIcon ({
    super.key, 
    this.icon, 
    this.onPress, 
    this.color = Colors.blue, 
    this.enable = true,
    
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: enable==true ? onPress:null,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 200,
          height: 50,
          alignment: Alignment.center,
          child: Icon(
            icon,
            size: 40,
            color: enable==true ? color:Colors.grey,
          ),
        ),
      ),
    );
  }
}