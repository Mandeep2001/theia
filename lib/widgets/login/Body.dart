import 'package:flutter/material.dart';

import 'BodyTop.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
    @required GlobalKey<FormState> formKey,
  }) : _formKey = formKey, super(key: key);

  final GlobalKey<FormState> _formKey;

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
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            BodyTop(),
            SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              onTap: () {
                if (_formKey.currentState.validate()) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Processing Data'),
                    ),
                  );
                }
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 15.0),
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  'Accedi',
                  style:
                  Theme.of(context).textTheme.button.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Problemi con l\'accesso?',
                  style: Theme.of(context).textTheme.caption,
                ),
                SizedBox(width: 5.0),
                Text(
                  'Contattaci!',
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
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
                'Non possiedi ancora un account?',
                style: Theme.of(context).textTheme.caption,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 15.0),
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  'Creane uno!',
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}