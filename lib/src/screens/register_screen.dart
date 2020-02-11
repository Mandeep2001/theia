import 'package:flutter/material.dart';
import 'package:theia/src/widgets/auth/header.dart';
import 'package:theia/src/widgets/auth/register_body.dart';

class RegisterScreen extends StatelessWidget {
  static const String id = '/register';

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
                  RegisterBody(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
