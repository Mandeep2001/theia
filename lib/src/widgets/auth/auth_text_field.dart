import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Function onFieldSubmitted;
  final String errorText;
  final IconData prefixIcon;
  final Function validator;
  final bool obscureText;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final Widget suffixIcon;

  const AuthTextField({
    Key key,
    @required this.hintText,
    @required this.controller,
    @required this.prefixIcon,
    @required this.validator,
    this.suffixIcon,
    this.textInputAction,
    this.focusNode,
    this.obscureText = false,
    this.onFieldSubmitted,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      focusNode: focusNode,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        errorText: errorText,
        contentPadding: EdgeInsets.only(top: 15.0),
        prefixIcon: Icon(
          prefixIcon,
          size: 16.0,
        ),
        suffixIcon: suffixIcon,
        errorStyle: Theme.of(context).textTheme.overline.copyWith(
              color: Colors.red,
            ),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyText2,
      ),
      validator: validator,
    );
  }
}
