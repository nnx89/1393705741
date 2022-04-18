
import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:whos_here/friend/page/friend_page.dart';

class tempFriend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          CupertinoScaffold.showCupertinoModalBottomSheet(
              context: context,
              builder: (context) => friendPage(),
              enableDrag: true,
              expand: true,
              backgroundColor: Colors.grey);
        },
        child: AvatarView(
          radius: 70,
          borderWidth: 8,
          borderColor: Colors.red,
          avatarType: AvatarType.CIRCLE,
          backgroundColor: Colors.lightBlueAccent,
          imagePath: "assets/images/friend.jpg",
        ));
  }
}
