import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:technical_test_double_v_partners/features/data/repository/auth_repository.dart';
import 'package:technical_test_double_v_partners/features/data/repository/persistent_repository.dart';
import 'package:technical_test_double_v_partners/features/domain/inputs/birthdate.dart';
import 'package:technical_test_double_v_partners/features/presentation/blocs/profile/profile_cubit.dart';
import 'package:technical_test_double_v_partners/features/presentation/screens/screens.dart';
import 'package:technical_test_double_v_partners/features/presentation/widgets/profile/custom_item_info_profile.dart';
import 'package:technical_test_double_v_partners/features/presentation/widgets/widgets.dart';


class ProfileScreen extends StatelessWidget {

  static const name = 'profile_screen';
  final String? email;
  final String? password;

  final authRepository = AuthRepository();
  final persistentRepository = PersistentRepository();

  ProfileScreen({super.key, required this.email, required this.password}); 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProfileCubit(
          authRepository, 
          persistentRepository)..loadUserData(email!, password!),
        child: _ProfileView(email: email, password: password)
      ),
    );
  }

}

class _ProfileView extends StatelessWidget {

  final String? email;
  final String? password;

  const _ProfileView({
    super.key, 
    required this.email, 
    required this.password,
  });

  @override
  Widget build(BuildContext context) {

    final profileCubit = context.watch<ProfileCubit>();
    final profileStatus = profileCubit.state.profileStatus;

    return SafeArea(
      child: Stack( children: [
        _ProfileViewInfo(profileCubit: profileCubit),
        if(profileStatus==ProfileStatus.isLoading)
        CustomLoadingView()
      ]),
    );
  }
}

class _ProfileViewInfo extends StatelessWidget {

  final ProfileCubit profileCubit;

  _ProfileViewInfo({
    super.key,
    required this.profileCubit,
  });
  
  

  @override
  Widget build(BuildContext context) {

    final firstName = profileCubit.state.firstName;
    final lastName = profileCubit.state.lastName;
    final birthdate = profileCubit.state.birthdate;
    final email = profileCubit.state.email;
    final password = profileCubit.state.password;
    final addressList = profileCubit.state.addresses;

    return Padding(
      padding:  const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomProfileTitleText(text: 'Información Perfil',),
            SizedBox(height: 20,),
    
            CustomProfileSubtitleText(text: 'Nombre'),
            CustomItemInfoProfile(text: firstName, icon: Icons.person),
            SizedBox(height: 20,),
    
            CustomProfileSubtitleText(text: 'Apellido'),
            CustomItemInfoProfile(text: lastName, icon: Icons.person),
            SizedBox(height: 20,),
    
            CustomProfileSubtitleText(text: 'Fecha de nacimiento'),
            CustomItemInfoProfile(text: birthdate, icon: Icons.calendar_month),
            SizedBox(height: 20,),
    
            CustomProfileSubtitleText(text: 'Correo'),
            CustomItemInfoProfile(text: email, icon: Icons.mail),
            SizedBox(height: 20,),
    
            CustomProfileSubtitleText(text: 'Direcciones'),
            
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: addressList.length,
              itemBuilder: (context, index) {
                return CustomItemInfoProfile(text: addressList[index], icon: Icons.apartment);
              },
            ),

            SizedBox(height: 20,),

            Container(
              alignment: Alignment.center,
              child: CustomButton(
                text: 'Cerrar sesión',
                onPress: () async{
                  await profileCubit.logOut();
                  context.go('/check_auth');

                },
              )
            )

    
          ],
        ),
      ),
    );
  }
}