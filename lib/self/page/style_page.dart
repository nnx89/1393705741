import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../style_resource/style1.dart';
import '../style_resource/style2.dart';
import '../style_resource/style3.dart';


class styleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        padding: EdgeInsets.all(10),
        color: Colors.transparent,
        child:
        GridView.count(
            crossAxisCount: 1,
            padding: const EdgeInsets.all(10),
            scrollDirection: Axis.horizontal,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            children: [
              bubbleType1(),
              bubbleType2(),
              bubbleType3(),
              bubbleType1(),
              bubbleType1(),
              bubbleType1()
            ])
    );
  }
}
