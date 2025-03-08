import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:technical_test_double_v_partners/presentation/screens/screens.dart';

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
              context.pushNamed(ProfileScreen.name);
            },
            child:Text('Go to sign up screen')
          )
        ],
      ),
    );
  }
}