import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whos_here/utils/controller.dart';

class CircleBubble extends StatefulWidget {
  const CircleBubble({Key? key}) : super(key: key);

  @override
  State<CircleBubble> createState() => _CircleBubbleState();
}

class _CircleBubbleState extends State<CircleBubble> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: colorStreamController.stream,
      initialData: Colors.lightBlueAccent,
      builder: (BuildContext context, AsyncSnapshot<Color> snapshot){
        return AvatarView(
          radius: 100,
          borderWidth: 13,
          borderColor: (snapshot.data)!,
          avatarType: AvatarType.CIRCLE,
          backgroundColor: Colors.red,
          imagePath:
          "assets/images/profile.jpg",
        );
      },
    );

  }
}