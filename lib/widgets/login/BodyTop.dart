import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BodyTop extends StatelessWidget {
  final FocusNode _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Bentornato',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(
            height: 25.0,
          ),
          TextFormField(
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (v) {
              FocusScope.of(context)
                  .requestFocus(_passwordFocus);
            },
            decoration: InputDecoration(
              prefixIcon: Icon(
                FontAwesomeIcons.user,
                size: 16.0,
              ),
              errorStyle: Theme.of(context)
                  .textTheme
                  .overline
                  .copyWith(
                color: Colors.red,
              ),
              hintText: 'username',
              hintStyle:
              Theme.of(context).textTheme.bodyText2,
            ),
            validator: (value) {
              if (value.trim().isEmpty) {
                return 'Devi inserire uno username';
              }

              return null;
            },
          ),
          SizedBox(height: 4.0),
          TextFormField(
            focusNode: _passwordFocus,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (value) {
              // TODO: assegnare lo stesso metodo del pulsante accedi
            },
            obscureText: true,
            decoration: InputDecoration(
              prefixIcon: Icon(
                FontAwesomeIcons.lock,
                size: 16.0,
              ),
              errorStyle: Theme.of(context)
                  .textTheme
                  .overline
                  .copyWith(
                color: Colors.red,
              ),
              hintText: 'password',
              hintStyle:
              Theme.of(context).textTheme.bodyText2,
              suffixIcon: IconButton(
                icon: Icon(
                  FontAwesomeIcons.eye,
                  color: Colors.black38,
                  size: 16.0,
                ),
                onPressed: () {},
              ),
            ),
            validator: (value) {
              if (value.trim().isEmpty)
                return 'Devi inserire una password';

              return null;
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              'Password dimenticata?',
              style: Theme.of(context).textTheme.caption,
            ),
          ),
        ],
      ),
    );
  }
}
