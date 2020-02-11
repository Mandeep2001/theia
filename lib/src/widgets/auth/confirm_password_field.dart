import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:theia/src/widgets/auth/auth_text_field.dart';

class ConfirmPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function onFieldSubmit;
  final String password;
  final String errorText;

  const ConfirmPasswordField({
    Key key,
    @required this.controller,
    @required this.focusNode,
    @required this.onFieldSubmit,
    @required this.errorText,
    @required this.password,
  }) : super(key: key);

  @override
  _ConfirmPasswordFieldState createState() => _ConfirmPasswordFieldState();
}

class _ConfirmPasswordFieldState extends State<ConfirmPasswordField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return AuthTextField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      textInputAction: TextInputAction.done,
      onFieldSubmitted: widget.onFieldSubmit,
      obscureText: _obscurePassword,
      prefixIcon: FontAwesomeIcons.lock,
      hintText: 'Conferma password',
      errorText: widget.errorText,
      suffixIcon: IconButton(
        icon: Icon(
          _obscurePassword ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
          color: Colors.black38,
          size: 16.0,
        ),
        onPressed: () {
          setState(() {
            _obscurePassword = !_obscurePassword;
          });
        },
      ),
      validator: (value) {
        if (value != widget.password)
          return 'Le due password devono corrispondere';

        return null;
      },
    );
  }
}
