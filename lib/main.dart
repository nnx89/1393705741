// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whoshere/widgets/chat_view.dart';
import './widgets/MapView.dart';
import './mock/mockMapOverLays.dart';
import 'package:whoshere/mock/mockTagList.dart';
import 'package:whoshere/widgets/TagSelector.dart';
import 'package:whoshere/widgets/SearchBarDelegate.dart';
import 'package:whoshere/widgets/FilledIconButton.dart';
import 'package:whoshere/page/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: "Who's Here"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedTagIndex = 0;

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).viewPadding.top;
    double windowWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Stack(
        children: [
          MapView(
            overlays: mockMapOverLays,
          ),
          SizedBox(
            width: windowWidth,
            height: statusBarHeight + 40,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: windowWidth - 40,
                  child: TagSelector(
                    tabTitleList: tagList,
                    select: _selectedTagIndex,
                    onTap: (int index) {
                      setState(() {
                        _selectedTagIndex = index;
                      });
                    },
                  ),
                ),
                SizedBox(
                    width: 40,
                    height: 40,
                    child: IconButton(
                      splashColor: Color.fromARGB(255, 0, 0, 255),
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        showSearch(
                            context: context, delegate: SearchBarDelegate());
                      },
                    )),
              ],
            ),
          ),
          Positioned(
              bottom: 20,
              right: 20,
              child: FilledIconButton(
                background: Colors.blueAccent,
                cb: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                ),
              ))
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
