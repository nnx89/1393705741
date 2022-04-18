import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whos_here/utils/controller.dart';


class bubbleType3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 150,
      child: InkWell(
          onTap: () {
            typeChoosingController.add(3);
          },
          child: AvatarView(
            radius: 40,
            borderWidth: 10,
            borderColor: Colors.lightBlue,
            avatarType: AvatarType.RECTANGLE,
            backgroundColor: Colors.red,
            imagePath: "assets/images/profile.jpg",
            placeHolder: Container(
              child: Icon(
                Icons.person,
                size: 50,
              ),
            ),
            errorWidget: Container(
              child: Icon(
                Icons.error,
                size: 50,
              ),
            ),
          )),
    );
  }
}
