import 'package:flutter/material.dart';

class CustomMessageWindow extends StatelessWidget {

  final String title;
  final String message;
  final Function()? onPress;

  const CustomMessageWindow({
    super.key, 
    required this.message,
    required this.title,
    this.onPress
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black45,
        child: Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.blue)
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(title, style: TextStyle(fontSize: 24))
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(message, style: TextStyle(fontSize: 16))
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: onPress , 
                      child: Text(
                        'OK', 
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    
                    ),
                  )
                ],
              ),
            ),
          ),
        ),  
      );
  }
}