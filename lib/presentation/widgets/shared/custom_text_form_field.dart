import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  final String? label;
  final String? hint;
  final String? errorMessage;
  final IconData? icon;
  final Function(String)? onChange;
  final String? Function(String?)? validator;
  final bool obscureText;
  

  const CustomTextFormField({
    super.key, 
    this.label, 
    this.hint, 
    this.errorMessage, 
    this.onChange, 
    this.validator, 
    this.icon, 
    this.obscureText=false
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
    );


    return TextFormField(
      onChanged:  onChange,
      validator: validator,
      obscureText: obscureText,

      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(borderSide: BorderSide(color: colors.primary)),
        errorBorder: border.copyWith(borderSide: BorderSide(color: Colors.redAccent)),
        focusedErrorBorder: border.copyWith(borderSide: BorderSide(color: Colors.redAccent)),
        
        isDense: true,
        icon: icon != null ? Icon(icon) : null,
        label: label != null ? Text(label!) : null,
        hintText: hint,
        errorText: errorMessage,
      
        
      ),
    );
  }
}