import 'package:flutter/material.dart';
import 'package:theia/src/screens/login_screen.dart';
import 'package:theia/src/widgets/auth/register_form.dart';

class RegisterBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.0),
          topRight: Radius.circular(50.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RegisterForm(),
          SizedBox(
            height: 20.0,
          ),
          Divider(),
          SizedBox(
            height: 20.0,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Possiedi già un account?',
              style: Theme.of(context).textTheme.caption,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              padding: EdgeInsets.symmetric(vertical: 14.0),
              color: Theme.of(context).primaryColor,
              child: Text(
                'Accedi!',
                style: Theme.of(context).textTheme.button,
              ),
              onPressed: () {
                navigateLoginScreen(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  void navigateLoginScreen(BuildContext context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(LoginScreen.id, (route) => false);
  }
}
