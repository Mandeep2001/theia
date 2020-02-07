import 'package:flutter/material.dart';
import 'package:theia/widgets/home/post_element.dart';

class PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        PostElement(),
        SizedBox(
          height: 20.0,
        ),
        PostElement(),
      ],
    );
  }
}
