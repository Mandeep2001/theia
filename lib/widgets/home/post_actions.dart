import 'package:flutter/material.dart';

class PostActions extends StatelessWidget {
  final bool liked;
  final Function onTap;

  const PostActions({@required this.liked, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Row(
              children: <Widget>[
                GestureDetector(
                  child: liked
                      ? Icon(
                          Icons.favorite,
                          color: Colors.redAccent,
                        )
                      : Icon(Icons.favorite_border),
                  onTap: onTap,
                ),
                SizedBox(
                  width: 8.0,
                ),
                Text(
                  '289',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 20.0,
            ),
            Row(
              children: <Widget>[
                Icon(Icons.chat_bubble_outline),
                SizedBox(
                  width: 8.0,
                ),
                Text(
                  '56',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        IconButton(icon: Icon(Icons.more_horiz), onPressed: () {})
      ],
    );
  }
}
