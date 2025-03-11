import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:technical_test_double_v_partners/features/presentation/screens/screens.dart';
import 'package:technical_test_double_v_partners/features/presentation/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {

  static const String name = 'login_screen';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _LoginView(),
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo( size: 100),
              SizedBox(
                height: 20
              ),
              _LoginForm(),
            ],
          ),
                ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20
          ),
          CustomTextFormField(
            label: 'Usuario',
            icon: Icons.mail,
          ),
          SizedBox(
            height: 20
          ),
          CustomTextFormField(
            label: 'Contraseña',
            icon: Icons.lock,
          ),
          SizedBox(
            height: 20
          ),
          CustomButton(
            text: 'Ingresar'
          )
        ],
      ),
    );
  }
}