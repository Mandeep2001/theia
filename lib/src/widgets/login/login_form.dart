import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:theia/src/blocs/auth/login/bloc.dart';
import 'package:theia/src/screens/home_screen.dart';
import 'package:theia/src/widgets/common/cutom_dialog.dart';
import 'package:theia/src/widgets/login/auth_text_field.dart';

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

  bool _obscureText = true;
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
                      _buildUsernameField(context),
                      SizedBox(height: 6.0),
                      _buildPasswordField(context),
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
                _buildSubmitButton(context, state),
              ],
            ),
          );
        },
      ),
    );
  }

  Container _buildSubmitButton(BuildContext context, LoginState state) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: OutlineButton(
        color: Colors.white,
        focusNode: _loginButtonFocus,
        padding: const EdgeInsets.symmetric(vertical: 14.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        borderSide:
            BorderSide(width: 2.0, color: Theme.of(context).primaryColor),
        child: _getLoginButtonChild(context, state),
        highlightedBorderColor: Theme.of(context).primaryColor,
        textColor: Theme.of(context).primaryColor,
        onPressed: () => _submitForm(context),
      ),
    );
  }

  AuthTextField _buildUsernameField(BuildContext context) {
    return AuthTextField(
      hintText: 'Nome utente',
      controller: _usernameController,
      prefixIcon: FontAwesomeIcons.user,
      errorText: _usernameError,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(_passwordFocus);
      },
      validator: (value) {
        if (value.trim().isEmpty) {
          return 'Devi inserire un nome utente';
        }

        if (value.length < 3)
          return 'Il nome utente deve contenere almeno 3 caratteri';

        return null;
      },
    );
  }

  AuthTextField _buildPasswordField(BuildContext context) {
    return AuthTextField(
      controller: _passwordController,
      focusNode: _passwordFocus,
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (_) => _submitForm(context),
      obscureText: _obscureText,
      prefixIcon: FontAwesomeIcons.lock,
      hintText: 'password',
      errorText: _passwordError,
      suffixIcon: IconButton(
        icon: Icon(
          _obscureText ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
          color: Colors.black38,
          size: 16.0,
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      ),
      validator: (value) {
        if (value.trim().isEmpty) return 'Devi inserire una password';

        if (value.length < 6)
          return 'La password deve contenere almeno 6 caratteri';

        return null;
      },
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
