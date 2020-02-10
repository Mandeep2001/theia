import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:theia/src/blocs/auth/bloc.dart';
import 'package:theia/src/screens/home_screen.dart';

class BodyTop extends StatefulWidget {
  @override
  _BodyTopState createState() => _BodyTopState();
}

class _BodyTopState extends State<BodyTop> {
  final _formKey = GlobalKey<FormState>();
  Bloc<AuthEvent, AuthState> _authBloc;
  FocusNode _passwordFocus;
  TextEditingController _usernameController;
  TextEditingController _passwordController;

  bool _obscureText = true;
  String _usernameError;
  String _passwordError;

  @override
  void initState() {
    super.initState();
    _authBloc = BlocProvider.of<AuthBloc>(context);
    _passwordFocus = FocusNode();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _authBloc.close();
    _passwordFocus.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _authBloc,
      builder: (BuildContext context, AuthState state) {
        if (state is AuthErrorState) {
          throw Exception('Da implementare');
        }

        if (state is LoginErrorState) {
          _usernameError = state.loginResponse.usernameError;
          _passwordError = state.loginResponse.passwordError;
        }

        if (state is LoginSuccessState) {
          Navigator.pushNamed(context, HomeScreen.id);
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
    );
  }

  Container _buildSubmitButton(BuildContext context, AuthState state) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: OutlineButton(
        padding: const EdgeInsets.symmetric(vertical: 14.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        borderSide:
            BorderSide(width: 2.0, color: Theme.of(context).primaryColor),
        child: _getLoginButtonChild(context, state),
        highlightedBorderColor: Theme.of(context).primaryColor,
        textColor: Theme.of(context).primaryColor,
        onPressed: _submitForm,
      ),
    );
  }

  TextFormField _buildUsernameField(BuildContext context) {
    return TextFormField(
      controller: _usernameController,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(_passwordFocus);
      },
      decoration: InputDecoration(
        errorText: _usernameError,
        contentPadding: EdgeInsets.only(top: 15.0),
        prefixIcon: Icon(
          FontAwesomeIcons.user,
          size: 16.0,
        ),
        errorStyle: Theme.of(context).textTheme.overline.copyWith(
              color: Colors.red,
            ),
        hintText: 'Nome utente',
        hintStyle: Theme.of(context).textTheme.bodyText2,
      ),
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

  TextFormField _buildPasswordField(BuildContext context) {
    return TextFormField(
      controller: _passwordController,
      focusNode: _passwordFocus,
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (_) => _submitForm(),
      obscureText: _obscureText,
      decoration: InputDecoration(
        errorText: _passwordError,
        contentPadding: EdgeInsets.only(top: 15.0),
        prefixIcon: Icon(
          FontAwesomeIcons.lock,
          size: 16.0,
        ),
        errorStyle: Theme.of(context).textTheme.overline.copyWith(
              color: Colors.red,
            ),
        hintText: 'password',
        hintStyle: Theme.of(context).textTheme.bodyText2,
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
      ),
      validator: (value) {
        if (value.trim().isEmpty) return 'Devi inserire una password';

        if (value.length < 6)
          return 'La password deve contenere almeno 6 caratteri';

        return null;
      },
    );
  }

  Widget _getLoginButtonChild(BuildContext context, AuthState state) {
    if (state is AuthLoadingState) {
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

  void _submitForm() {
    if (_formKey.currentState.validate()) {
      _authBloc.add(
        LoginEvent(
            username: _usernameController.text,
            password: _passwordController.text),
      );
    }
  }
}
