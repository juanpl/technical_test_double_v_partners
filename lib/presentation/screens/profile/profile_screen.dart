import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {

  static const name = 'profile_features_screen';

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
            
            },
            child:Text('Go to sign up screen')
          )
        ],
      ),
    );
  }

}