import 'package:flutter/material.dart';

import 'package:theia/widgets/home/header.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 25.0,
              ),
              Header(),
            ],
          ),
        ),
      ),
    );
  }
}
