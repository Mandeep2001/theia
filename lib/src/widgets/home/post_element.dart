import 'package:flutter/material.dart';
import 'package:theia/src/widgets/home/post_actions.dart';
import 'package:theia/src/widgets/home/post_image.dart';

class PostElement extends StatefulWidget {
  const PostElement({Key key}) : super(key: key);

  @override
  _PostElementState createState() => _PostElementState();
}

class _PostElementState extends State<PostElement> {
  bool liked = false;

  void _setLiked() {
    setState(() {
      liked = !liked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Container(
        child: Row(
          children: <Widget>[
            Container(
              width: 35.0,
              height: 35.0,
              decoration: BoxDecoration(
                color: Color(0xFFF9564F),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5.0,
                    offset: Offset(2.0, 4.0),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'eminem',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          PostImage(onDoubleTap: _setLiked),
          PostActions(
            liked: liked,
            onTap: _setLiked,
          ),
        ],
      ),
    );
  }
}
