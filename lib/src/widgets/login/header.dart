import 'package:flutter/material.dart';

class Header extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
      EdgeInsets.only(left: 40.0, top: 30.0, bottom: 20.0),
      child: Text(
        'THEIA',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
