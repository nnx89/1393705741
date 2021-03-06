// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:whoshere/widgets/plain_bubble.dart';
import 'package:whoshere/controller/controller.dart';
import 'package:whoshere/model/bubble_info.dart';

void swicthStyle(int style, String tag) {
  typeChoosingController.add(BubbleStyleInfo(bubbleStyle: style, tag: tag));
}

class StyleWidget extends StatelessWidget {
  final String avatarPath;
  final String tag;
  const StyleWidget({Key? key, required this.avatarPath, required this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 1,
        padding: const EdgeInsets.all(10),
        scrollDirection: Axis.horizontal,
        mainAxisSpacing: 0,
        children: [
          Align(
            child: PlainBubble(
              style: 1,
              cb: () => swicthStyle(1, tag),
              avatarPath: avatarPath,
            ),
          ),
          // bubbleType1(),
          Align(
            child: PlainBubble(
              style: 2,
              paddingValue: 0,
              cb: () => swicthStyle(2, tag),
              size: 100,
              avatarPath: avatarPath,
            ),
          ),
          Align(
            child: PlainBubble(
              style: 3,
              paddingValue: 0,
              cb: () => swicthStyle(3, tag),
              size: 100,
              avatarPath: avatarPath,
            ),
          ),
        ]);
  }
}
