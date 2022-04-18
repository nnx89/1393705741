import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whos_here/utils/controller.dart';


class bubbleType2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
        SizedBox(
          height: 10,
          width: 150,
          child: InkWell(
              onTap: () {
                typeChoosingController.add(2);
              },
              child:
                 AvatarView(
                  radius: 1000,
                  borderWidth: 10,
                  borderColor: Colors.lightBlue,
                  avatarType: AvatarType.CIRCLE,
                  backgroundColor: Colors.red,
                  imagePath: "assets/images/profile.jpg",
                  ),
       ),
        );

  }
}
