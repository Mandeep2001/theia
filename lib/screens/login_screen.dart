import 'package:flutter/material.dart';
import 'package:theia/widgets/login/Body.dart';
import 'package:theia/widgets/login/Header.dart';

class LoginScreen extends StatelessWidget {
  static const String id = '/login';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: AnimatedContainer(
              duration: Duration(microseconds: 200),
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Header(),
                  Body(formKey: _formKey),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


