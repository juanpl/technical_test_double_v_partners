import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:technical_test_double_v_partners/features/data/repository/auth_repository.dart';
import 'package:technical_test_double_v_partners/features/data/repository/persistent_repository.dart';
import 'package:technical_test_double_v_partners/features/domain/entities/user.dart';
import 'package:technical_test_double_v_partners/features/presentation/screens/screens.dart';

class CheckAuthScreen extends StatelessWidget {

  static const String name = 'check_auth_screen';

  const CheckAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final authRepository = AuthRepository();
    final persistentRepository = PersistentRepository();

    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: authRepository.readToken(), 
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            
            if (!snapshot.hasData)
              return Text('Espere');

            if( snapshot.data == ''){
              Future.microtask((){

                context.pushReplacement('/login');
                
                /*Navigator.pushReplacement(context, PageRouteBuilder(
                  pageBuilder: (_, __ , ___) => LoginScreen(),
                  transitionDuration: Duration( seconds: 0)
                  )
                );*/

              });
            } else {
              Future.microtask((){
                
                User user = persistentRepository.getUserInfo();

                context.goNamed(
                  ProfileScreen.name,
                  queryParameters: {'email': user.email, 'password': user.password},
                );
                /*Navigator.pushReplacement(context, PageRouteBuilder(
                  pageBuilder: (_, __, ___) => ProfileScreen(email: user.email, password: snapshot.data),  //We are using the password as a token  
                  transitionDuration: Duration( seconds: 0)
                  )
                );*/

              });
            }

            return Container();
            

          },
        ),
      ),
    );
  }
}