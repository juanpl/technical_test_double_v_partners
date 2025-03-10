import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test_double_v_partners/presentation/blocs/register/register_cubit.dart';
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
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView()
      ),
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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final TextEditingController _dateController = TextEditingController();
    final registerCubit = context.watch<RegisterCubit>();
    
    context.select((RegisterCubit value){
      _dateController.text = value.state.birthdate.value;
    });

    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            onChange: (value){
              registerCubit.firstNameChanged(value);
              _formKey.currentState?.validate();
            },
            label: 'Nombre',
            icon: Icons.person,
          ),
          const SizedBox(height: 10,),
          CustomTextFormField(
            onChange: (value){
              registerCubit.lastNameChanged(value);
              _formKey.currentState?.validate();
            },
            icon: Icons.person,
            label: 'Apellido'
          ),
          const SizedBox(height: 20,),
          CustomTextFormField(
            controller: _dateController,
            onTap: () async {
             DateTime? date =  await _selectDate(context);
             if(date != null){
              registerCubit.birthdateChanged(date);

             }
            },
            icon: Icons.calendar_month,
            label: 'Fecha de nacimiento',
            readOnly: true,
          ),
          const SizedBox(height: 20,),
          CustomTextFormField(
            onChange: (value){
              registerCubit.emailChanged(value);
              _formKey.currentState?.validate();
            },
            icon: Icons.mail,
            label: 'Correo Electrónico'
          ),
          const SizedBox(height: 20,),
          CustomTextFormField(
            onChange: (value){
              registerCubit.passwordChanged(value);
              _formKey.currentState?.validate();
            },
            icon: Icons.lock,
            label: 'Contraseña',
            obscureText: true,
          ),
          const SizedBox(height: 20,),
          BlocBuilder<RegisterCubit, RegisterFormState>(
            builder: (context, state) {
              return 
              state.andressInputVisibility ?
              Row(
                children:[
                  Expanded(
                    flex: 14,
                    child: CustomTextFormField(
                      onChange: (value){
                        registerCubit.addressChanged(value);
                        _formKey.currentState?.validate();
                      },
                      icon: Icons.apartment,
                      label: 'Dirección',
                      readOnly: true,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Icon(Icons.check_circle, size: 40, color: Colors.green)
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(width: 5,)
                  )

                ] 
              ):Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:[
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Icon(Icons.apartment, size: 18)
                    )
                  ),
                  Expanded(
                    flex: 5,
                    child: Text(
                      'Agregar dirección', 
                      style: TextStyle(color: Colors.black87, fontSize: 16),
                      textAlign: TextAlign.end,
                    )
                  ),
                  Expanded(
                    flex: 1,
                    child: Icon(Icons.add_circle, size: 40, color: Colors.blue)
                  ),

                ] 
              );
            },
          ),

          const SizedBox(height: 20,),
          CustomButton(
            onPress: (){
              registerCubit.onSubmit();
              //final isValid = _formKey.currentState!.validate();
              //( !isValid ) return;
            },
            text: 'Suscribirse',

          ),

        ]
      )
    );
  }
}


  Future<DateTime?> _selectDate(BuildContext context) async {

    int legalBornAge = DateTime.now().year-10;

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(legalBornAge-1),
      firstDate: DateTime(1920),
      lastDate: DateTime(legalBornAge),
    );

    if (pickedDate != null) {
      return pickedDate;
    }
    
  }

