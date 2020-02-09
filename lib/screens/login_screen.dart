import 'package:flutter/material.dart';
import 'package:theia/widgets/login/body.dart';
import 'package:theia/widgets/login/header.dart';

class LoginScreen extends StatelessWidget {
  static const String id = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Header(),
                  Body(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
