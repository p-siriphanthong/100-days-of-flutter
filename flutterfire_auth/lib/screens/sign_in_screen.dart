import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'package:flutterfire_auth/widgets/input.dart';
import 'package:flutterfire_auth/widgets/button.dart';
import 'package:flutterfire_auth/widgets/social_button.dart';
import 'package:flutterfire_auth/widgets/unauthentication_guard.dart';
import 'package:flutterfire_auth/services/authentication_service.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isSubmitting = false;
  bool _isShowError = false;

  void onSignIn() {
    if (_formKey.currentState!.saveAndValidate()) {
      setState(() {
        _isSubmitting = true;
      });

      String email = _formKey.currentState!.value['email'];
      String password = _formKey.currentState!.value['password'];

      signInWithEmailAndPassword(
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
                      'Sign In',
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
                      ]),
                    ),
                    SizedBox(height: 32),
                    Button(
                      text: 'Sign In',
                      onPressed: _isSubmitting ? null : onSignIn,
                    ),
                    SizedBox(height: 32),
                    Row(
                      children: [
                        Expanded(child: Divider()),
                        SizedBox(width: 8),
                        Text('or'),
                        SizedBox(width: 8),
                        Expanded(child: Divider()),
                      ],
                    ),
                    SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SocialButton(
                          button: Buttons.Facebook,
                          onPressed: () => {},
                        ),
                        SocialButton(
                          button: Buttons.Twitter,
                          onPressed: () => {},
                        ),
                        SocialButton(
                          button: Buttons.Email,
                          onPressed: () => {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Don't have an account?"),
                  SizedBox(width: 8),
                  GestureDetector(
                    child: Text(
                      'Sign up',
                      style: TextStyle(color: Colors.blue),
                    ),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, 'sign_up');
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
