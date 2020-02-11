import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:theia/src/widgets/auth/auth_text_field.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode nextFocus;
  final Function onFieldSubmit;
  final String errorText;

  const PasswordField({
    Key key,
    @required this.controller,
    @required this.focusNode,
    @required this.onFieldSubmit,
    @required this.errorText,
    this.nextFocus,
  }) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return AuthTextField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      textInputAction: widget.nextFocus == null
          ? TextInputAction.done
          : TextInputAction.next,
      onFieldSubmitted: (_) {
        if (widget.nextFocus != null) {
          FocusScope.of(context).requestFocus(widget.nextFocus);
        } else {
          widget.onFieldSubmit(context);
        }
      },
      obscureText: _obscurePassword,
      prefixIcon: FontAwesomeIcons.lock,
      hintText: 'password',
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
        if (value.trim().isEmpty) return 'Devi inserire una password';

        if (value.length < 6)
          return 'La password deve contenere almeno 6 caratteri';

        return null;
      },
    );
  }
}
