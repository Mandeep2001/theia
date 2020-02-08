import 'package:flutter/material.dart';

import 'package:theia/screens/home_screen.dart';
import 'package:theia/screens/login_screen.dart';
import 'package:theia/screens/splash_screen.dart';

void main() => runApp(Theia());

class Theia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Theia',
      theme: ThemeData(
        primaryColor: Color(0xFFF9564F),
        textTheme: Theme.of(context).textTheme.copyWith(
              headline6: TextStyle(
                color: Colors.white,
                fontSize: 34.0,
                fontWeight: FontWeight.bold,
              ),
              caption: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Color(0xFFBDBDBD),
              ),
              subtitle1: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 20.0,
              ),
          bodyText2: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
              ),
            ),
      ),
      initialRoute: LoginScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        HomeScreen.id: (context) => HomeScreen(),
      },
    );
  }
}
