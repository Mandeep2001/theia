import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:theia/src/blocs/auth/bloc.dart';

class BodyTop extends StatefulWidget {
  @override
  _BodyTopState createState() => _BodyTopState();
}

class _BodyTopState extends State<BodyTop> {
  final _formKey = GlobalKey<FormState>();
  Bloc<AuthEvent, AuthState> _authBloc;
  FocusNode _passwordFocus;

  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _authBloc = BlocProvider.of<AuthBloc>(context);
    _passwordFocus = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _authBloc.close();
    _passwordFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _authBloc,
      builder: (BuildContext context, AuthState state) {
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
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (v) {
                        FocusScope.of(context).requestFocus(_passwordFocus);
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 15.0),
                        prefixIcon: Icon(
                          FontAwesomeIcons.user,
                          size: 16.0,
                        ),
                        errorStyle:
                            Theme.of(context).textTheme.overline.copyWith(
                                  color: Colors.red,
                                ),
                        hintText: 'nome utente',
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
                    ),
                    SizedBox(height: 6.0),
                    TextFormField(
                      focusNode: _passwordFocus,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => _submitForm(),
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 15.0),
                        prefixIcon: Icon(
                          FontAwesomeIcons.lock,
                          size: 16.0,
                        ),
                        errorStyle:
                            Theme.of(context).textTheme.overline.copyWith(
                                  color: Colors.red,
                                ),
                        hintText: 'password',
                        hintStyle: Theme.of(context).textTheme.bodyText2,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? FontAwesomeIcons.eye
                                : FontAwesomeIcons.eyeSlash,
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
                        if (value.trim().isEmpty)
                          return 'Devi inserire una password';

                        if (value.length < 6)
                          return 'La password deve contenere almeno 6 caratteri';

                        return null;
                      },
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
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: OutlineButton(
                  padding: EdgeInsets.symmetric(vertical: 14.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  borderSide: BorderSide(
                      width: 2.0, color: Theme.of(context).primaryColor),
                  child: _getLoginButtonChild(context, state),
                  highlightedBorderColor: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).primaryColor,
                  onPressed: _submitForm,
                ),
              ),
            ],
          ),
        );
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
      _authBloc.add(LoginEvent());
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Processing Data'),
        ),
      );
    }
  }
}
