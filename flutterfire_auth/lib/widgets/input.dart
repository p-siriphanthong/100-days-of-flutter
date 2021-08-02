import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Input extends StatelessWidget {
  final String name;
  final String? labelText;
  final String? hintText;
  final bool isPassword;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onChanged;
  final FormFieldSetter<String>? onSaved;

  const Input({
    Key? key,
    required this.name,
    this.labelText,
    this.hintText,
    this.isPassword = false,
    this.validator,
    this.onChanged,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved,
      obscureText: isPassword,
    );
  }
}
