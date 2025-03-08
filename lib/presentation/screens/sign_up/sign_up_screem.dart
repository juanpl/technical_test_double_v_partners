import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {

  static const name = 'sign_up_screen';

  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('sing up screen'),
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