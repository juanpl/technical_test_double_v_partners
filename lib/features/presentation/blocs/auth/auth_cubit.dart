import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:formz/formz.dart';
import 'package:equatable/equatable.dart';
import 'package:technical_test_double_v_partners/features/data/datasources/users_local_data_source.dart';
import 'package:technical_test_double_v_partners/features/data/repository/auth_repository.dart';
import 'package:technical_test_double_v_partners/features/domain/entities/user.dart';
import 'package:technical_test_double_v_partners/features/domain/inputs/inputs.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {

  final AuthRepository authRepository;

  AuthCubit(this.authRepository) : super(AuthState());



  void onSubmit() {

    final isValid = Formz.validate([
      state.password,
      state.email,
    ]);

    emit(
      state.copyWith(
        formStatus: isValid ? FormStatus.validating : FormStatus.invalid,
        password: Password.dirty(state.password.value),
        email: Email.dirty(state.email.value),
        isValid: isValid
      )
    );

  }

  Future<bool> successfullyLogged() async{
    
    User? userLogged = await authRepository.loginUser(state.email.value, state.password.value);

    if(userLogged != null){
      emit(
        state.copyWith(
          formStatus: FormStatus.joined,
        )
      );
      return true;
    }

    else{
      emit(
        state.copyWith(
          formStatus: FormStatus.dbError,
        )
      );
      return false;
    }
    
  }

  void closeWindoMessage(){
      emit(
        state.copyWith(
          formStatus: FormStatus.invalid,
        )
      );
  }


  void emailChanged( String value){

    final email = Email.dirty(value); 

    emit(
      state.copyWith(
        email: email,
        isValid:Formz.validate([email, state.password]) 
      )
    );
  }

  void passwordChanged( String value){

    final password = Password.dirty(value);

    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([password, state.email]) 
      )
    );
  }
}
