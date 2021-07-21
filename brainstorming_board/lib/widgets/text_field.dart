import 'package:flutter/material.dart';

class TextField extends StatelessWidget {
  final String hintText;
  final bool? isTextArea;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;

  const TextField({
    Key? key,
    required this.hintText,
    this.isTextArea,
    this.validator,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: isTextArea == true ? 4 : 1,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        filled: true,
      ),
      validator: validator,
      onSaved: onSaved,
    );
  }
}
