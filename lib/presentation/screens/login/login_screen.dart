import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {

  static const String name = 'login_screen';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: (){
             
            },
            child:Text('Go to sign up screen')
          )
        ],
      ),
    );
  }
}