import 'package:formz/formz.dart';

// Define input validation errors
enum EmailError { empty, formart }

// Extend FormzInput and provide the input type and error type.
class Email extends FormzInput<String, EmailError> {
  // Call super.pure to represent an unmodified form input.
  const Email.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Email.dirty(String value) : super.dirty(value);

  static     final emailRegExp = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );



  String? get errorMessage {
    if(isValid || isPure) return null;
    if(displayError == EmailError.empty) return 'El campo es requerido';
    if(displayError == EmailError.formart) return 'No tiene formato de correo electrónico';
  }

  // Override validator to handle validating a given input value.
  @override
  EmailError? validator(String value) {

    if (value.isEmpty || value.trim().isEmpty) return EmailError.empty;
    if (!emailRegExp.hasMatch(value)) return EmailError.formart;

    return null;
  }
}