import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:technical_test_double_v_partners/features/data/repository/auth_repository.dart';
import 'package:technical_test_double_v_partners/features/presentation/blocs/auth/auth_cubit.dart';
import 'package:technical_test_double_v_partners/features/presentation/screens/screens.dart';
import 'package:technical_test_double_v_partners/features/presentation/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {

  static const String name = 'login_screen';
  final authRepository = AuthRepository();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => AuthCubit(authRepository),
        child: _LoginView()
      ),
    );
  }
}



class _LoginView extends StatelessWidget {
  const _LoginView();

  @override
  Widget build(BuildContext context) {

    

    final authCubit = context.watch<AuthCubit>();
    final formField = authCubit.state.formStatus;


    return SafeArea(
      child: Stack(
        children: [
          _LoginUI(authCubit: authCubit),
          if(formField == FormStatus.validating)
          CustomLoadingView(),
          if(formField == FormStatus.dbError)
          CustomMessageWindow(
            message: 'El correo electrónico o la contraseña son incorrectos', 
            title: 'Error',
            onPress: (){
              authCubit.closeWindoMessage();
            },
          )
        ] 
      ),
    );
  }
}

class _LoginUI extends StatelessWidget {
  const _LoginUI({
    super.key,
    required this.authCubit,
  });

  final AuthCubit authCubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            _LoginForm(authCubit: authCubit,),
          ],
        ),
              ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {

  final AuthCubit authCubit;

  _LoginForm({
    required this.authCubit
  });



  @override
  Widget build(BuildContext context) {

    final email = authCubit.state.email ;
    final password = authCubit.state.password;
    final formStatus = authCubit.state.formStatus;

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
            onChange: (value) {
              authCubit.emailChanged(value);
            },
            errorMessage: email.errorMessage,
          ),
          SizedBox(
            height: 20
          ),
          CustomTextFormField(
            label: 'Contraseña',
            icon: Icons.lock,
            onChange: (value) {
              authCubit.passwordChanged(value);
            },
            errorMessage: password.errorMessage,
            obscureText: true,
          ),
          SizedBox(
            height: 20
          ),
          CustomButton(
            text: 'Ingresar',
            onPress: () async{
              authCubit.onSubmit();
              if(authCubit.state.isValid){
                bool successfullyLoggedState = await authCubit.successfullyLogged();
                if(successfullyLoggedState){
                  context.pushNamed(
                    ProfileScreen.name,
                    queryParameters: {'email': email.value, 'password': password.value},
                  );
                }
              }
            },
          ),
          SizedBox(
            height: 10
          ),
          CustomSubscriptionText(
            onPress: (){
              context.push('/sign_on');
            },
          )
        ],
      ),
    );
  }
}