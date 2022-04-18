import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whos_here/self/widget/color_picker.dart';

import '../widget/color_button.dart';

class colorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget> [
          SizedBox(height: 10.0,),
          Row(
            children: <Widget>[
              SizedBox(width: 10.0),
              ColorButton((Colors.red)),
              SizedBox(width: 5.0),
              ColorButton((Colors.orange)),
              SizedBox(width: 5.0),
              ColorButton((Colors.yellow)),
              SizedBox(width: 5.0),
              ColorButton((Colors.green)),
              SizedBox(width: 5.0),
              ColorButton((Colors.blue)),
              SizedBox(width: 5.0),
              ColorButton((Colors.purple)),
              SizedBox(width: 5.0),
              ColorButton(Colors.pink),
            ],
          ),
          Row(
            children: [
              SizedBox(width: 10.0),
              ColorButton(Colors.cyan),
              SizedBox(width: 5.0),
              ColorButton(Colors.teal),
              SizedBox(width: 5.0),
              ColorButton(Colors.grey),
              SizedBox(width: 5.0),
              ColorButton(Colors.black),
            ],
          ),
          SizedBox(height: 10.0,),
          Center(
            child: ColorPicker(350)
          )
        ],
      );
  }
}