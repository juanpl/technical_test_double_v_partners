import 'package:flutter/material.dart';
import 'package:technical_test_double_v_partners/features/data/repository/auth_repository.dart';

class CheckAuthScreen extends StatelessWidget {

  static const String name = 'check_auth_screen';

  const CheckAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final authRepository = AuthRepository();

    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: authRepository.readToken(), 
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            
            return(Text('Espere...'));

            /*Future.microtask(){
              context.na
            }*/

          },
        ),
      ),
    );
  }
}