import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final FocusNode focusNode;
  final Widget child;
  final Function onPressed;

  const SubmitButton(
      {Key key,
      @required this.focusNode,
      @required this.child,
      @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: OutlineButton(
        color: Colors.white,
        focusNode: focusNode,
        padding: const EdgeInsets.symmetric(vertical: 14.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        borderSide:
            BorderSide(width: 2.0, color: Theme.of(context).primaryColor),
        child: child,
        highlightedBorderColor: Theme.of(context).primaryColor,
        textColor: Theme.of(context).primaryColor,
        onPressed: onPressed,
      ),
    );
  }
}
