import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theia/src/blocs/auth/bloc.dart';
import 'package:theia/src/services/auth/concrete_auth_service.dart';
import 'package:theia/src/widgets/login/body.dart';
import 'package:theia/src/widgets/login/header.dart';

class LoginScreen extends StatelessWidget {
  static const String id = '/login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (BuildContext context) => AuthBloc(ConcreteAuthService()),
      child: Scaffold(
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
      ),
    );
  }
}
