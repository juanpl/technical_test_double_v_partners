import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:technical_test_double_v_partners/features/presentation/screens/screens.dart';
import 'package:technical_test_double_v_partners/features/presentation/widgets/profile/custom_item_info_profile.dart';
import 'package:technical_test_double_v_partners/features/presentation/widgets/widgets.dart';


class ProfileScreen extends StatelessWidget {

  static const name = 'profile_screen';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _ProfileView(),
    );
  }

}

class _ProfileView extends StatelessWidget {
  const _ProfileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomProfileTitleText(text: 'Información Perfil',),
              SizedBox(height: 20,),

              CustomProfileSubtitleText(text: 'Nombre'),
              CustomItemInfoProfile(text: 'Juan Pablo', icon: Icons.person),
              SizedBox(height: 20,),

              CustomProfileSubtitleText(text: 'Apellido'),
              CustomItemInfoProfile(text: 'Lasprilla', icon: Icons.person),
              SizedBox(height: 20,),

              CustomProfileSubtitleText(text: 'Fecha de nacimiento'),
              CustomItemInfoProfile(text: '10/11/1994', icon: Icons.calendar_month),
              SizedBox(height: 20,),

              CustomProfileSubtitleText(text: 'Correo'),
              CustomItemInfoProfile(text: 'juanpablolasprillacorrea@gmail.com', icon: Icons.mail),
              SizedBox(height: 20,),

              CustomProfileSubtitleText(text: 'Contraseña'),
              CustomItemInfoProfile(text: '********', icon: Icons.lock),
              SizedBox(height: 20,),

              CustomProfileSubtitleText(text: 'Direcciones'),
              CustomItemInfoProfile(text: 'direción 1', icon: Icons.apartment),
              CustomItemInfoProfile(text: 'direción 2', icon: Icons.apartment),
              SizedBox(height: 20,),

            ],
          ),
        ),
      ),
    );
  }
}