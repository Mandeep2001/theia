import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theia/src/blocs/auth/login/bloc.dart';
import 'package:theia/src/screens/home_screen.dart';
import 'package:theia/src/widgets/auth/password_field.dart';
import 'package:theia/src/widgets/auth/submit_button.dart';
import 'package:theia/src/widgets/auth/username_field.dart';
import 'package:theia/src/widgets/common/cutom_dialog.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  Bloc<LoginEvent, LoginState> _loginBloc;
  FocusNode _passwordFocus;
  FocusNode _loginButtonFocus;
  TextEditingController _usernameController;
  TextEditingController _passwordController;

  String _usernameError;
  String _passwordError;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _passwordFocus = FocusNode();
    _loginButtonFocus = FocusNode();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _loginBloc.close();
    _passwordFocus.dispose();
    _loginButtonFocus.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _loginBloc,
      listener: (BuildContext context, LoginState state) {
        if (state is LoginErrorState) {
          showDialog(
            context: context,
            builder: (BuildContext context) => CustomDialog(
              title: 'Error',
              description: state.message,
              buttonText: 'Okay',
            ),
          );
        }

        if (state is LoginSuccessState) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(HomeScreen.id, (route) => false);
        }
      },
      child: BlocBuilder(
        bloc: _loginBloc,
        builder: (BuildContext context, LoginState state) {
          if (state is CredentialsErrorState) {
            _usernameError = state.loginResponse.usernameError;
            _passwordError = state.loginResponse.passwordError;
          }

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
                        'Bentornato',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      UsernameField(
                        errorText: _usernameError,
                        controller: _usernameController,
                        nextFocus: _passwordFocus,
                      ),
                      SizedBox(height: 6.0),
                      PasswordField(
                        controller: _passwordController,
                        errorText: _passwordError,
                        focusNode: _passwordFocus,
                        onFieldSubmit: (_) => _submitForm(context),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Password dimenticata?',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
                SubmitButton(
                  focusNode: _loginButtonFocus,
                  child: _getLoginButtonChild(context, state),
                  onPressed: () => _submitForm(context),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _getLoginButtonChild(BuildContext context, LoginState state) {
    if (state is LoginLoadingState) {
      return SizedBox(
        width: 16.0,
        height: 16.0,
        child: CircularProgressIndicator(
          valueColor:
              AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
          strokeWidth: 2.5,
        ),
      );
    }

    return Text('Accedi');
  }

  void _submitForm(BuildContext context) {
    FocusScope.of(context).requestFocus(_loginButtonFocus);
    if (_formKey.currentState.validate()) {
      _loginBloc.add(
        SignInEvent(
            username: _usernameController.text,
            password: _passwordController.text),
      );
    }
  }
}
