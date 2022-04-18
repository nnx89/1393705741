import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:whos_here/stranger/page/stranger_page.dart';

class tempStranger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          CupertinoScaffold.showCupertinoModalBottomSheet(
              context: context,
              builder: (context) => strangerPage(),
              enableDrag: true,
              expand: true,
              backgroundColor: Colors.grey);
        },
        child: AvatarView(
          radius: 70,
          borderWidth: 8,
          borderColor: Colors.black,
          avatarType: AvatarType.CIRCLE,
          backgroundColor: Colors.lightBlueAccent,
          imagePath: "assets/images/smith.jpg",
        ));
  }
}