import 'package:flutter/material.dart';

class PostActions extends StatefulWidget {
  final bool liked;
  final Function onTap;

  const PostActions({@required this.liked, @required this.onTap});

  @override
  _PostActionsState createState() => _PostActionsState();
}

class _PostActionsState extends State<PostActions>
    with SingleTickerProviderStateMixin {
  Animation animation, transformationAnimation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        duration: Duration(microseconds: 2000), vsync: this);

    animation = Tween(begin: 20.0, end: 50.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.ease));

    animation.addListener(() {
      setState(() {});
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      }
    });

    // transformationAnimation = SizeTween(begin: Size(20.0, 20.0)).animate(
    //     CurvedAnimation(parent: _animationController, curve: Curves.ease));
  }

  void _setLiked() {
    widget.onTap();
    _animationController.forward();
  }

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
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (BuildContext context, Widget child) {
                      return widget.liked
                          ? Icon(
                              Icons.favorite,
                              size: animation.value,
                              color: Colors.redAccent,
                            )
                          : Icon(Icons.favorite_border);
                    },
                  ),
                  onTap: _setLiked,
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
