import 'package:flutter/material.dart';

class MyPixel extends StatelessWidget {
  final Color outerColor;
  final Color innerColor;
  final Widget child;
  const MyPixel({Key key, this.outerColor, this.child, this.innerColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: outerColor,
      margin: const EdgeInsets.all(1.0),
      child: Card(
        color: innerColor,
        child: Center(child: child),
      ),
    );
  }
}
