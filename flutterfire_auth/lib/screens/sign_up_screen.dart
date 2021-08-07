import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:flutterfire_auth/widgets/button.dart';
import 'package:flutterfire_auth/widgets/input.dart';
import 'package:flutterfire_auth/widgets/unauthentication_guard.dart';
import 'package:flutterfire_auth/services/authentication_service.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isSubmitting = false;
  bool _isShowError = false;

  void onSignUp() {
    if (_formKey.currentState!.saveAndValidate()) {
      setState(() {
        _isSubmitting = true;
      });

      String email = _formKey.currentState!.value['email'];
      String password = _formKey.currentState!.value['password'];

      signUpWithEmailAndPassword(
        email: email,
        password: password,
      ).catchError((err) {
        // TODO: handle error
        print('Error: $err');

        setState(() {
          _isSubmitting = false;
        });
      });
    } else {
      setState(() {
        _isShowError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return UnauthenticationGuard(
      child: Scaffold(
        body: SafeArea(
          minimum: EdgeInsets.only(left: 24, right: 24, top: 100, bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FormBuilder(
                key: _formKey,
                autovalidateMode:
                    _isShowError ? AutovalidateMode.onUserInteraction : null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 32),
                    Input(
                      name: 'email',
                      labelText: 'Email',
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        FormBuilderValidators.email(context),
                      ]),
                    ),
                    SizedBox(height: 16),
                    Input(
                      name: 'password',
                      labelText: 'Password',
                      isPassword: true,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        FormBuilderValidators.minLength(context, 8),
                      ]),
                    ),
                    SizedBox(height: 16),
                    Input(
                      name: 'password_confirmation',
                      labelText: 'Confirm Password',
                      isPassword: true,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        (String? value) {
                          String? password =
                              _formKey.currentState!.fields['password']?.value;

                          if (value != password)
                            return 'The password confirmation does not match.';
                          return null;
                        },
                      ]),
                    ),
                    SizedBox(height: 32),
                    Button(
                      text: 'Sign Up',
                      onPressed: _isSubmitting ? null : onSignUp,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Already have an account?"),
                  SizedBox(width: 8),
                  GestureDetector(
                    child: Text(
                      'Sign in',
                      style: TextStyle(color: Colors.blue),
                    ),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, 'sign_in');
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
