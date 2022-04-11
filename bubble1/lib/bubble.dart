import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';

class Bubble extends StatelessWidget {
  final String avatar;

  const Bubble({
    Key? key,
    required this.avatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: AvatarGlow(
        startDelay: Duration(milliseconds: 1000),
        glowColor: Colors.blue,
        //边框大小
        endRadius: 120.0,
        duration: Duration(milliseconds: 2000),
        repeat: true,
        showTwoGlows: true,
        repeatPauseDuration: Duration(milliseconds: 100),
        child: Material(
          elevation: 8.0,
          shape: CircleBorder(),
          color: Colors.transparent,
          child: CircleAvatar(
            //picture
            backgroundImage: AssetImage(avatar),
            radius: 70.0,
          ),
        ),
        shape: BoxShape.circle,
        animate: true,
        curve: Curves.fastOutSlowIn,
      ),
    );
  }
}
