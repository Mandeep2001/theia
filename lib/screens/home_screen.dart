import 'package:flutter/material.dart';

// import 'package:theia/widgets/home/header.dart';
import 'package:theia/widgets/home/post_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Theia',
          style: TextStyle(color: Colors.black87),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {},
            color: Colors.black87,
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: <Widget>[
              // SizedBox(
              //   height: 30.0,
              // ),
              // Header(),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: PostList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
