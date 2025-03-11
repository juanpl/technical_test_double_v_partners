part of 'register_cubit.dart';

enum FormStatus {invalid, valid, validating, posting}

class RegisterFormState extends Equatable {
  
  final FormStatus formStatus;
  final bool isValid;
  final FirstName firstName;
  final LastName lastName;
  final Birthdate birthdate;
  final String email;
  final Password password;
  final String address;
  final bool andressInputVisibility;
  final List<String> addressList;

  const RegisterFormState({
    this.formStatus = FormStatus.invalid, 
    this.isValid = false,
    this.firstName = const FirstName.pure() , 
    this.lastName = const LastName.pure(), 
    this.birthdate = const Birthdate.pure(), 
    this.email = '', 
    this.password = const Password.pure(), 
    this.address = '',
    this.andressInputVisibility = false,
    this.addressList = const [],
  });

  RegisterFormState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    FirstName? firstName,
    LastName? lastName,
    Birthdate? birthdate,
    String? email,
    Password? password,
    String? address,
    bool? andressInputVisibility,
    List<String>? addressList
  }) => RegisterFormState(
    formStatus: formStatus ?? this.formStatus,
    isValid: isValid ?? this.isValid,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    birthdate: birthdate ?? this.birthdate,
    email: email ?? this.email,
    password: password ?? this.password,
    address: address ?? this.address,
    andressInputVisibility: andressInputVisibility ?? this.andressInputVisibility,
    addressList: addressList ?? this.addressList
  );
    

  @override
  List<Object> get props => [formStatus, isValid, firstName, lastName, birthdate, email, password, address, andressInputVisibility, addressList];
}

