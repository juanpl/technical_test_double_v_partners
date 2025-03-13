import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:equatable/equatable.dart';
import 'package:technical_test_double_v_partners/features/data/datasources/users_local_data_source.dart';
import 'package:technical_test_double_v_partners/features/domain/entities/user.dart';
import 'package:technical_test_double_v_partners/features/domain/inputs/inputs.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState());

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
    
    User? userLogin = await UsersLocalDataSource.db.getUserByEmailAndPassword(state.email.value, state.password.value);

    if(userLogin != null){

      emit(
        state.copyWith(
          formStatus: FormStatus.joined,
        )
      );

      return true;
    }

    else{

        state.copyWith(
          formStatus: FormStatus.dbError,
        );

      return false;
    }
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
