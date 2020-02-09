import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  static const String id = '/login';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 40.0, top: 30.0),
                  child: Text(
                    'THEIA',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                Container(
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
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    FontAwesomeIcons.user,
                                    size: 16.0,
                                  ),
                                  errorStyle:
                                      Theme.of(context).textTheme.overline.copyWith(
                                            color: Colors.red,
                                          ),
                                  hintText: 'username',
                                  hintStyle: Theme.of(context).textTheme.bodyText2,
                                ),
                                validator: (value) {
                                  if (value.trim().isEmpty) {
                                    return 'Devi inserire uno username';
                                  }

                                  return null;
                                },
                              ),
                              SizedBox(height: 4.0),
                              TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
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
                                      FontAwesomeIcons.eye,
                                      color: Colors.black38,
                                      size: 16.0,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                                validator: (value) {
                                  if (value.trim().isEmpty)
                                    return 'Devi inserire una password';

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
                            ],
                          ),
                        ),
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
                              style: Theme.of(context).textTheme.button.copyWith(
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
                              style: Theme.of(context).textTheme.caption.copyWith(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
