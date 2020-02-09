import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Hello',
              style: TextStyle(fontSize: 16.0, color: Colors.black45),
            ),
            Text(
              'Mandeep',
              style: TextStyle(
                fontSize: 34.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Color(0xFFF9564F),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                offset: Offset(2.0, 4.0),
              ),
            ],
          ),
        ),
        // GestureDetector(
        //   onTap: () {
        //     print('Button pressed');
        //   },
        //   child: Image.network(
        //     'https://www.lascimmiapensa.com/wp-content/uploads/2020/01/Eminem-2-696x400.jpg',
        //     height: 50.0,
        //     width: 50.0,
        //     fit: BoxFit.cover,
        //   ),
        // ),
      ],
    );
  }
}
