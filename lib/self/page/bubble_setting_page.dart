import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whos_here/utils/controller.dart';
import 'package:whos_here/self/page/emoji_page.dart';
import 'package:whos_here/self/page/style_page.dart';
import 'package:whos_here/self/widget/preview.dart';


import '../widget/category.dart';
import 'color_page.dart';
import '../widget/flow_bubble.dart';

class tempSelf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          context: context,
          builder: (context)=>SettingPage(),
          isScrollControlled: false,
          enableDrag: true,
        );
      },
      child: const AvatarGlow(
        startDelay: Duration(milliseconds: 1000),
        glowColor: Colors.blue,
        //边框大小
        endRadius: 100.0,
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
            backgroundImage: NetworkImage(
                'https://img0.baidu.com/it/u=1579365749,3577175995&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=475'),
            radius: 50.0,
          ),
        ),
        shape: BoxShape.circle,
        animate: true,
        curve: Curves.fastOutSlowIn,
      ),
    );
  }
}

class tapBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              child: const Text(
                'Cancel',
                style:
                TextStyle(color: Colors.black, fontSize: 17.0, height: 1.0),
              ),
              onPressed: () {
                Navigator.pop(context);
                // showDialog<Null>(
                //   context: context,
                //   builder: (BuildContext context) {
                //     return DecoratedBox(
                //       decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                //       child: AlertDialog(
                //         title: Text("Warning"),
                //         content: Text("Want to save your bubble setting?"),
                //         actions: <Widget>[
                //             TextButton(
                //                 child: Text("Save"),
                //                 onPressed: () => {Navigator.of(context).popUntil((route) => route.isFirst)}),
                //             SizedBox(width: 125,),
                //             TextButton(
                //                 child: Text("Don't save"),
                //                 onPressed: () => {Navigator.of(context).popUntil((route) => route.isFirst)}),
                //         ],
                //       ),
                //     );
                //   },
                // );
              }),
          TextButton(
            child: Text(
              'Done',
              style:
              TextStyle(color: Colors.black, fontSize: 17.0, height: 1.0),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      decoration:
      BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(4.0))),
    );
  }
}

class SettingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: childPageStreamController.stream,
        initialData: 0,
        builder: (BuildContext context, AsyncSnapshot<int> snapshot){
          return Column(
                // scrollDirection: Axis.vertical,
                children: <Widget>[
                  tapBar(),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Preview(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Categories(),
                  Divider(
                    height: 0.0,
                    color: Colors.grey[800],
                  ),
                  SizedBox(height: 5,),
                  if (snapshot.data == 0)colorWidget(),
                  if (snapshot.data == 1)styleWidget(),
                  if (snapshot.data == 2)emojiWidget(),
                ],
              );

        }
    );
  }
}
