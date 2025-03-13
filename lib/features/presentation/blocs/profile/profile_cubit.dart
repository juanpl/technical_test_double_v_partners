import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:technical_test_double_v_partners/features/data/datasources/users_local_data_source.dart';
import 'package:technical_test_double_v_partners/features/domain/entities/user.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {

  ProfileCubit() : super(ProfileInitial());

  Future<void> loadUserData(String email, String password) async {
    try {

      emit(state.copyWith(
          profileStatus: ProfileStatus.isLoading
      ));

      User? userInfo = await UsersLocalDataSource.db.getUserByEmailAndPassword(email, password);

      if(userInfo==null){
        emit(state.copyWith(
          profileStatus: ProfileStatus.error
        ));
      }

      else{
        emit(state.copyWith(
          profileStatus: ProfileStatus.loaded,
          firstName: userInfo.firstName,
          lastName: userInfo.lastName,
          birthdate: userInfo.birthdate,
          email: userInfo.email,
          password: userInfo.password,
          addresses: userInfo.addresses           
        ));
      }

    } catch (e){

      emit(state.copyWith(
          profileStatus: ProfileStatus.error
      ));

    }
  }

}
