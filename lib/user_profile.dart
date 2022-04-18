import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TextFieldState();
  }
}

class _TextFieldState extends State<TextFieldWidget> {
  TextEditingController _userEtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _userEtController,
            ),
            RaisedButton(
              child: Text("赋值"),
              onPressed: () {
                setState(() {
                  _userEtController.text = "Who is here";
                });
              },
            ),
            RaisedButton(
              child: Text("获取值"),
              onPressed: () {
                setState(() {});
              },
            ),
            Text(_userEtController.text),
          ],
        ),
      ),
    );
  }
}

