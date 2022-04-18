import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whos_here/friend/widgets/emojis.dart';


class emoji_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 80,
          child: Container(
            height: 500,
            width: 530,
            child: gridView(),
          ),
        ),
        Container(
          height: 400,
          alignment: Alignment.topCenter,
          // width: 300,
          child:
          ElevatedButton(
              onPressed: () {},
              child: Text("Send message"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  shape: MaterialStateProperty.all(StadiumBorder(
                      side: BorderSide(
                        style: BorderStyle.solid,
                      ))))),

        ),
      ],
    );
  }
}



