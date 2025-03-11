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

  @override
  Widget build(BuildContext context) {

    final TextEditingController _dateController = TextEditingController();
    final registerCubit = context.watch<RegisterCubit>();
    
    final firstName = registerCubit.state.firstName;
    final lastName = registerCubit.state.lastName;
    final birthhDate = registerCubit.state.birthdate;
    final password = registerCubit.state.password;
    
    context.select((RegisterCubit value){
      _dateController.text = value.state.birthdate.value;
    });

    return Form(
      child: Column(
        children: [

          CustomTextFormField(
            onChange: (value){
              registerCubit.firstNameChanged(value);
            },
            errorMessage: firstName.isPure || firstName.isValid
              ? null
              : 'Usuario no válido'
            ,
            label: 'Nombre',
            icon: Icons.person,
          ),

          const SizedBox(height: 10,),

          CustomTextFormField(
            onChange: (value){
              registerCubit.lastNameChanged(value);
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
            },
            icon: Icons.mail,
            label: 'Correo Electrónico'
          ),
          const SizedBox(height: 20,),
          CustomTextFormField(
            onChange: (value){
              registerCubit.passwordChanged(value);
            },
            icon: Icons.lock,
            label: 'Contraseña',
            obscureText: true,
          ),
          const SizedBox(height: 20,),

          registerCubit.state.andressInputVisibility ?
          Row(
            children:[
              Expanded(
                flex: 14,
                child: CustomTextFormField(
                  onChange: (value){
                    registerCubit.addressChanged(value);
                  },
                  icon: Icons.apartment,
                  label: 'Dirección',
                ),
              ),
              Expanded(
                flex: 1,
                child: CustomPushIcon(
                  color: Colors.green,
                  icon: Icons.add_circle,
                  enable: registerCubit.state.address.length>4,
                  onPress: () {
                    registerCubit.setShowAddressInput(false);
                    registerCubit.addNewAddress();
                  },
                ),
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
                child: CustomPushIcon(
                  icon: Icons.add_circle,
                  onPress: () {
                    registerCubit.setShowAddressInput(true);
                  },
                )
              ),

            ] 
          ),
          const SizedBox(height: 20,),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Lista de direcciones:', 
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(height: 10,),

          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: registerCubit.state.addressList.length, // Número de elementos en la lista
            itemBuilder: (context, index) {
              return Row (children: [
                Icon(Icons.apartment, size: 16),
                Text(registerCubit.state.addressList[index], style: TextStyle(fontSize: 16),)
              ],);
            },
          ),
          
          const SizedBox(height: 20,),
          CustomButton(
            onPress: (){
              registerCubit.onSubmit();
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

