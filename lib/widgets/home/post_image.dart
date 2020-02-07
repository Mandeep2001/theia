import 'package:flutter/material.dart';

class PostImage extends StatelessWidget {
  final Function onDoubleTap;

  const PostImage({@required this.onDoubleTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      margin: EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
        color: Color(0xFFF9564F),
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(2.0, 5.0),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child: GestureDetector(
          onDoubleTap: onDoubleTap,
          child: Image.network(
            'https://i0.wp.com/www.mam-e.it/wp-content/uploads/2019/10/mame-spettacolo-eminem-la-storia-drammatica-dellicona-del-rap-1.jpg?resize=992%2C680&ssl=1',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
