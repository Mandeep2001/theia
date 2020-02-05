import 'package:flutter/material.dart';

import 'package:theia/screens/home_screen.dart';

void main() => runApp(Theia());

class Theia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Theia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
