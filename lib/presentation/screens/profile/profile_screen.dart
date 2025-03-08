import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:technical_test_double_v_partners/presentation/screens/screens.dart';


class ProfileScreen extends StatelessWidget {

  static const name = 'profile_screen';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('profile_features'),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: (){
              context.pushNamed(LoginScreen.name);
            },
            child:Text('Go to sign up screen')
          )
        ],
      ),
    );
  }

}