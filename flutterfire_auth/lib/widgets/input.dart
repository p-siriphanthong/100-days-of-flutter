import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final bool isPassword;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;

  const Input({
    Key? key,
    this.labelText,
    this.hintText,
    this.isPassword = false,
    this.validator,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      validator: validator,
      onSaved: onSaved,
      obscureText: isPassword,
    );
  }
}
