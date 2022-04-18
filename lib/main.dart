import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:whos_here/friend/tempfriend.dart';
import 'package:whos_here/self/page/bubble_setting_page.dart';
import 'package:whos_here/stranger/tempstranger.dart';


void main() {
  runApp(MaterialApp(
    title: "Who is Here",
    home: homePage(),
  ));
}


class homePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
        body: CupertinoPageScaffold(
            child: Scaffold(
              appBar: AppBar(title: Text('Map Page')),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // 好友
                      tempFriend(),
                      // 陌生人
                      tempStranger()
                    ],
                  ),
                  // 自己
                  tempSelf(),
                ],
              )
            )));
  }
}

