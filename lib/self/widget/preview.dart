import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whos_here/utils/controller.dart';
import 'flow_bubble.dart';
import 'circle_bubble.dart';
import 'rectangle_bubble.dart';

class Preview extends StatefulWidget {
  @override
  _previewState createState() => _previewState();
}

class _previewState extends State<Preview> {

  @override
  Widget build(BuildContext context) {
    var stack = Stack(
      alignment: const FractionalOffset(0.3, 0.75),
      children: [
        Positioned(
          child: SizedBox(
              height: 150,
              width: 145,
              child: StreamBuilder(
                stream: typeChoosingController.stream,
                initialData: 0,
                builder: (BuildContext context, AsyncSnapshot<int> type) {
                  if (type.data == 0) return FlowBubble();
                  if (type.data == 2) return CircleBubble();
                  if (type.data == 3) return RectangleBubble();
                  else return FlowBubble();
                },
              )
          ),
        ),
        Positioned(
          left: 110,
          child: StreamBuilder(
            stream: emojiChoosingController.stream,
            initialData: '',
            builder: (BuildContext context, AsyncSnapshot<String> emoji) {
              return Text(emoji.data.toString(),style: TextStyle( fontSize: 30.0, ),);
            },
          ),
          top: 105,
          right: 10,
        ),
      ],
    );

    return stack;
  }
}
