import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:technical_test_double_v_partners/presentation/screens/screens.dart';
import 'package:technical_test_double_v_partners/presentation/widgets/widgets.dart';

class SignUpScreen extends StatelessWidget {

  static const String name = 'sign_up_screen';

  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo usuario'),
          
      ),
      body: _RegisterView(),
    );
  }
}

 class _RegisterView extends StatelessWidget {
  const _RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [

              FlutterLogo( size: 100),

              _RegisterForm(),

            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Nombre',
            icon: Icons.person,
          ),
          const SizedBox(height: 10,),
          CustomTextFormField(
            icon: Icons.person,
            label: 'Apellido'
          ),
          const SizedBox(height: 20,),
          CustomTextFormField(
            icon: Icons.calendar_month,
            label: 'Fecha de nacimiento'
          ),
          const SizedBox(height: 20,),
          CustomTextFormField(
            icon: Icons.location_city,
            label: 'Dirección'
          ),
          const SizedBox(height: 20,),
          CustomTextFormField(
            icon: Icons.mail,
            label: 'Correo Electrónico'
          ),
          const SizedBox(height: 20,),
          CustomTextFormField(
            icon: Icons.lock,
            label: 'Contraseña',
            obscureText: true,
          ),
          const SizedBox(height: 20,),
          FilledButton.tonalIcon(
            onPressed: (){}, 
            icon: const Icon(Icons.save),
            label: const Text('Crear usuario'),
          )
        ]
      )
    );
  }
}

