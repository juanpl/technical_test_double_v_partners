part of 'register_cubit.dart';

enum FormStatus {invalid, valid, validating, posting}

class RegisterFormState extends Equatable {
  
  final FormStatus formStatus;
  final bool isValid;
  final FirstName firstName;
  final LastName lastName;
  final Birthdate birthdate;
  final Email email;
  final Password password;
  final Address address;
  final bool andressInputVisibility;
  final List<String> addressList;
  final bool stateErrorListAdrees;

  const RegisterFormState({
    this.formStatus = FormStatus.invalid, 
    this.isValid = false,
    this.firstName = const FirstName.pure() , 
    this.lastName = const LastName.pure(), 
    this.birthdate = const Birthdate.pure(), 
    this.email = const Email.pure(), 
    this.password = const Password.pure(), 
    this.address = const Address.pure(),
    this.andressInputVisibility = false,
    this.addressList = const [],
    this.stateErrorListAdrees = false
  });

  RegisterFormState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    FirstName? firstName,
    LastName? lastName,
    Birthdate? birthdate,
    Email? email,
    Password? password,
    Address? address,
    bool? andressInputVisibility,
    List<String>? addressList,
    bool? stateErrorListAdrees,
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
    addressList: addressList ?? this.addressList,
    stateErrorListAdrees: stateErrorListAdrees ?? this.stateErrorListAdrees
  );
    

  @override
  List<Object> get props => [formStatus, isValid, firstName, lastName, birthdate, email, password, address, andressInputVisibility, addressList, email, stateErrorListAdrees];
}

