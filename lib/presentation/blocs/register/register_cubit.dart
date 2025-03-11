import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:technical_test_double_v_partners/infrastructure/inputs/birthDate.dart';
import 'package:technical_test_double_v_partners/infrastructure/inputs/inputs.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit() {
    emit(
      state.copyWith(
        formStatus: FormStatus.validating,
        firstName: FirstName.dirty(state.firstName.value),
        password: Password.dirty(state.password.value),

        isValid: Formz.validate([state.firstName, state.lastName, state.password, state.birthdate]) 
      )
    );
    print('Submit: $state');
  }

  void firstNameChanged( String value){

    final firstName = FirstName.dirty(value);

    emit(
      state.copyWith(
        firstName: firstName,
        isValid: Formz.validate([firstName, state.lastName, state.password, state.birthdate])
      )
    );
  }

  void lastNameChanged( String value){

    final lastName = LastName.dirty(value);

    emit(
      state.copyWith(
        lastName: lastName,
        isValid: Formz.validate([lastName, state.firstName, state.password, state.birthdate])
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
    emit(
      state.copyWith(
        email: value,
      )
    );
  }

  void passwordChanged( String value){

    final password = Password.dirty(value);

    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([password, state.firstName, state.lastName, state.birthdate])
      )
    );
  }

  void addressChanged( String value){
    emit(
      state.copyWith(
        address: value,
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
   
    List<String> newListAddres = List.from(state.addressList)..add(state.address);
    print(newListAddres);

    emit(
      state.copyWith(
        addressList: newListAddres,
        address: ''
      )
    );
  }
}


