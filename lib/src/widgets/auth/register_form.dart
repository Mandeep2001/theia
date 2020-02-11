import 'package:flutter/material.dart';
import 'package:theia/src/widgets/auth/confirm_password_field.dart';
import 'package:theia/src/widgets/auth/email_field.dart';
import 'package:theia/src/widgets/auth/password_field.dart';
import 'package:theia/src/widgets/auth/submit_button.dart';
import 'package:theia/src/widgets/auth/username_field.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _usernameController;
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _confirmPasswordController;
  String _usernameError;
  String _emailError;
  String _passwordError;
  String _confirmPasswordError;
  FocusNode _emailFocus;
  FocusNode _passwordFocus;
  FocusNode _confirmPasswordFocus;
  FocusNode _submitFocusNode;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _emailController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _emailFocus = FocusNode();
    _passwordFocus = FocusNode();
    _confirmPasswordFocus = FocusNode();
    _submitFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _confirmPasswordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _confirmPasswordFocus.dispose();
    _submitFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Benvenuto',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 25.0,
                ),
                UsernameField(
                  errorText: _usernameError,
                  controller: _usernameController,
                  nextFocus: _emailFocus,
                ),
                SizedBox(height: 6.0),
                EmailField(
                  errorText: _emailError,
                  controller: _emailController,
                  focusNode: _emailFocus,
                  nextFocus: _passwordFocus,
                ),
                SizedBox(height: 6.0),
                PasswordField(
                  errorText: _passwordError,
                  focusNode: _passwordFocus,
                  controller: _passwordController,
                  nextFocus: _confirmPasswordFocus,
                  onFieldSubmit: (_) => _submitForm(context),
                ),
                SizedBox(
                  height: 6.0,
                ),
                ConfirmPasswordField(
                  focusNode: _confirmPasswordFocus,
                  onFieldSubmit: (_) => _submitForm(context),
                  controller: _confirmPasswordController,
                  errorText: _confirmPasswordError,
                  password: _passwordController.text,
                ),
                SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
          SubmitButton(
            focusNode: _submitFocusNode,
            child: Text('Iscriviti'),
            onPressed: () => _submitForm(context),
          ),
        ],
      ),
    );
  }

  void _submitForm(BuildContext context) {
    _formKey.currentState.validate();
  }
}
