import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:formz/formz.dart';
import 'package:technical_test_double_v_partners/config/utils/password_hasher.dart';
import 'package:technical_test_double_v_partners/features/data/datasources/users_local_data_source.dart';
import 'package:technical_test_double_v_partners/features/data/repository/auth_repository.dart';
import 'package:technical_test_double_v_partners/features/domain/entities/user.dart';
import 'package:technical_test_double_v_partners/features/domain/inputs/inputs.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {

  final AuthRepository authRepository;
  
  RegisterCubit(this.authRepository) : super(const RegisterFormState());

  

  void onSubmit() {

    

    final isValid = Formz.validate([
      state.firstName,
      state.lastName,
      state.password,
      state.birthdate,
      state.email,
    ]);

    final stateErrorListAdrees = state.addressList.isEmpty;
    final bothAreValid = isValid && !stateErrorListAdrees;

    emit(
      state.copyWith(
        formStatus: bothAreValid ? FormStatus.validating : FormStatus.invalid,
        firstName: FirstName.dirty(state.firstName.value),
        lastName: LastName.dirty(state.lastName.value),
        birthdate: Birthdate.dirty(state.birthdate.value),
        password: Password.dirty(state.password.value),
        email: Email.dirty(state.email.value),
        stateErrorListAdrees: stateErrorListAdrees,
        isValid: bothAreValid
      )
    );

  }

  void closeMessageWindow() {
      emit(
        state.copyWith(
          formStatus: FormStatus.valid,
          messageInf: ''
        )
      );
  }



  void suscribeUser() async{

    User newUser = User(
      firstName: state.firstName.value, 
      lastName: state.lastName.value, 
      birthdate: state.birthdate.value, 
      email: state.email.value, 
      password: state.password.value, 
      addresses: state.addressList
    );

    final int userId = await authRepository.suscribeUser(newUser);

    if(userId == 0) {
      emit(
        state.copyWith(
          formStatus: FormStatus.dbError,
          titleMessageInf: 'Error',
          messageInf: 'El usuario ya está registrado'
        )
      );
    }

    else {
      emit(
        state.copyWith(
          formStatus: FormStatus.suscribed,
          titleMessageInf: 'Bienvenido',
          messageInf: 'El registro fue exitoso'
        )
      );
    }
  }


  void firstNameChanged( String value){

    final firstName = FirstName.dirty(value);

    emit(
      state.copyWith(
        firstName: firstName,
        isValid: Formz.validate([firstName, state.lastName, state.password, state.birthdate, state.email]) 
      )
    );
  }

  void lastNameChanged( String value){

    final lastName = LastName.dirty(value);

    emit(
      state.copyWith(
        lastName: lastName,
        isValid:Formz.validate([state.firstName, lastName, state.password, state.birthdate, state.email]) 
      )
    );
  }

  void birthdateChanged( DateTime value){
    
    String dateString = '${value.day}/${value.month}/${value.year}';
    final birthdate = Birthdate.dirty(dateString);

    emit(
      state.copyWith(
        birthdate: birthdate,
        isValid: Formz.validate([birthdate, state.lastName, state.firstName, state.password])
      )
    );
  }

  void emailChanged( String value){

    final email = Email.dirty(value); 

    emit(
      state.copyWith(
        email: email,
        isValid:Formz.validate([state.firstName, state.lastName, state.password, state.birthdate, email]) 
      )
    );
  }

  void passwordChanged( String value){

    final password = Password.dirty(value);

    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([state.firstName, state.lastName, password, state.birthdate, state.email]) 
      )
    );
  }

  void addressChanged( String value){

    final address = Address.dirty(value);

    emit(
      state.copyWith(
        address: address,
      )
    );
  }

  void setShowAddressInput(bool value){
    emit(
      state.copyWith(
        andressInputVisibility: value,
      )
    );
  }

  void addNewAddress(){
   
    final address = Address.dirty('');
    List<String> newListAddres = List.from(state.addressList)..add(state.address.value);
   
    if(state.address.value.length>5){
      emit(
        state.copyWith(
          addressList: newListAddres,
          address: address,
          stateErrorListAdrees: false,
          andressInputVisibility: false

        )
      );
    }


  }
}


