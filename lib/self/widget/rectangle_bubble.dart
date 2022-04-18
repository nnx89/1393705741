import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whos_here/utils/controller.dart';

class RectangleBubble extends StatefulWidget {
  const RectangleBubble({Key? key}) : super(key: key);

  @override
  State<RectangleBubble> createState() => _RectangleBubbleState();
}

class _RectangleBubbleState extends State<RectangleBubble> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: colorStreamController.stream,
      initialData: Colors.lightBlueAccent,
      builder: (BuildContext context, AsyncSnapshot<Color> snapshot){
        return SizedBox(child: AvatarView(
          radius: 70,
          borderWidth: 8,
          borderColor: (snapshot.data)!,
          avatarType: AvatarType.RECTANGLE,
          backgroundColor: Colors.red,
          imagePath:    "assets/images/profile.jpg",
        ),
          height: 10,
          width: 10,
        )
          ;
      },
    );

  }
}