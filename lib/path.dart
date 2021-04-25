import 'package:flutter/material.dart';

class MyPath extends StatelessWidget {
  final Color outerColor;
  final Color innerColor;
  final Widget child;
  const MyPath({Key key, this.outerColor, this.child, this.innerColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: outerColor,
      margin: const EdgeInsets.all(1.0),
      child: Card(
        color: innerColor,
        margin: const EdgeInsets.all(9.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(child: child),
      ),
    );
  }
}
