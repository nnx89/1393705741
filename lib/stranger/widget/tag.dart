import 'dart:math';

import 'package:flutter/cupertino.dart';

class tag extends StatelessWidget {
  String content;

  tag(this.content);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsetsDirectional.only(start: 10.0),
        height: 30,
        width: 100,
        decoration: BoxDecoration(
            color: Color.fromRGBO(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1),
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(10), right: Radius.circular(10))),
        child: Center(
          child: Text(
            content,
          ),
        ));
  }
}