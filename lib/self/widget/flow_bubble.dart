import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whos_here/utils/controller.dart';

class FlowBubble extends StatefulWidget {
  const FlowBubble({Key? key}) : super(key: key);

  @override
  State<FlowBubble> createState() => _FlowBubbleState();
}

class _FlowBubbleState extends State<FlowBubble> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: colorStreamController.stream,
      initialData: Colors.lightBlue,
      builder: (BuildContext context, AsyncSnapshot<Color> snapshot){
        return AvatarGlow(
          startDelay: Duration(milliseconds: 0),
          glowColor: (snapshot.data)!,
          //边框大小
          endRadius: 90.0,
          duration: Duration(milliseconds: 1000),
          repeat: true,
          showTwoGlows: true,
          repeatPauseDuration: Duration(milliseconds: 0),
          child: Material(
            elevation: 8.0,
            shape: CircleBorder(),
            color: Colors.transparent,
            child: CircleAvatar(
              //picture
              backgroundImage: NetworkImage(
                  'https://img0.baidu.com/it/u=1579365749,3577175995&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=475'),
              radius: 50.0,
            ),
          ),
          shape: BoxShape.circle,
          animate: true,
          curve: Curves.fastOutSlowIn,
        );
      },
    );

  }
}