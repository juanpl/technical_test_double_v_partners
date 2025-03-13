part of 'auth_cubit.dart';

enum FormStatus {invalid, valid, validating, dbError, joined}

class AuthState extends Equatable {

  final FormStatus formStatus;
  final Email email;
  final Password password;
  final bool isValid;

  const AuthState({
    this.formStatus = FormStatus.invalid, 
    this.email = const Email.pure(), 
    this.password = const Password.pure(), 
    this.isValid = true,
  });

  AuthState copyWith({
    FormStatus? formStatus,
    Email? email,
    Password? password,
    bool? isValid,
  }) => AuthState(
    formStatus: formStatus ?? this.formStatus,
    email: email ?? this.email,
    password: password ?? this.password,
    isValid: isValid ?? this.isValid
  );

  @override
  List<Object> get props => [formStatus, email, password, isValid];
}


