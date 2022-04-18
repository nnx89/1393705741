import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whos_here/utils/controller.dart';

//
class bubbleType1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        typeChoosingController.add(0);
      },
      child: AvatarGlow(
        startDelay: Duration(milliseconds: 0),
        glowColor: Colors.blue,
        //边框大小
        endRadius: 80.0,
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
            radius: 40.0,
          ),
        ),
        shape: BoxShape.circle,
        animate: true,
        curve: Curves.fastOutSlowIn,
      ),
    );

  }
}