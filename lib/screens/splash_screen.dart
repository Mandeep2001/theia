import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String id = '/splash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Text(
          'THEIA',
          style: TextStyle(color: Colors.white, fontSize: 34.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
