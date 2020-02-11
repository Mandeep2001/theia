import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:theia/src/widgets/auth/auth_text_field.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller;
  final String errorText;
  final FocusNode focusNode;
  final FocusNode nextFocus;

  const EmailField({
    Key key,
    @required this.controller,
    @required this.errorText,
    @required this.focusNode,
    @required this.nextFocus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthTextField(
      hintText: 'Email',
      controller: controller,
      prefixIcon: FontAwesomeIcons.envelope,
      errorText: errorText,
      textInputAction: TextInputAction.next,
      focusNode: focusNode,
      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(nextFocus);
      },
      validator: (value) {
        if (value.trim().isEmpty) {
          return 'Devi inserire un indirizzo email';
        }

        if (!EmailValidator.validate(value))
          return 'Inserisci un indirizzo email valido';

        return null;
      },
    );
  }
}
