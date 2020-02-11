import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:theia/src/widgets/auth/auth_text_field.dart';

class UsernameField extends StatelessWidget {
  final TextEditingController controller;
  final String errorText;
  final FocusNode nextFocus;

  const UsernameField(
      {Key key,
      @required this.controller,
      @required this.errorText,
      @required this.nextFocus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthTextField(
      hintText: 'Nome utente',
      controller: controller,
      prefixIcon: FontAwesomeIcons.user,
      errorText: errorText,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(nextFocus);
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
}
