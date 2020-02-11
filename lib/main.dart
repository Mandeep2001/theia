import 'package:flutter/material.dart';
import 'package:theia/src/screens/home_screen.dart';
import 'package:theia/src/screens/login_screen.dart';
import 'package:theia/src/screens/register_screen.dart';
import 'package:theia/src/screens/splash_screen.dart';

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
              headline4: TextStyle(
                color: Colors.white,
                fontSize: 34.0,
                fontWeight: FontWeight.bold,
              ),
              caption: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
              ),
              headline6: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 24.0,
              ),
              bodyText2: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Color(0xFFBDBDBD),
              ),
              overline: TextStyle(
                letterSpacing: 0.0,
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
              ),
              button: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      home: LoginScreen(),
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        HomeScreen.id: (context) => HomeScreen(),
      },
    );
  }
}
