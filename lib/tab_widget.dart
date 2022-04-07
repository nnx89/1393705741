import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



main() {
  runApp(MaterialApp(
    home: RootApp(),
  ));
}

class RootApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RootAppState();
  }
}

class _RootAppState extends State {
  List<String> list = [
    "西交利物浦大学",
    "ics专业",
    "男生",
    "女生",
    "上海人 ",
    "苏州人",
    "留学生",
    "180 ",
    "20岁"
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("who's here"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("选择你的tag： $_currentIndex"),
          Container(
            height: 90,
            child: CustomTabWidget(
              tabTitleList: list,
              select: _currentIndex,
              onTap: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}

///代码清单
class CustomTabWidget extends StatefulWidget {
  final List<String> tabTitleList;
  final int select;
  final Function(int index) onTap;

  const CustomTabWidget(
      {Key? key,
        required this.tabTitleList,
        this.select = 0,
        required this.onTap})
      : super(key: key);

  @override
  _CustomTabWidgetState createState() => _CustomTabWidgetState();
}

class _CustomTabWidgetState extends State<CustomTabWidget> {
  List<TabModel> _list = [];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    initDataFunction();
  }

  @override
  void didUpdateWidget(covariant CustomTabWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _currentIndex = widget.select;
    initDataFunction();
  }

  initDataFunction() {
    _list = [];
    for (int i = 0; i < widget.tabTitleList.length; i++) {
      String title = widget.tabTitleList[i];
      _list.add(TabModel(title: title, select: _currentIndex == i, id: i));
    }
    widget.tabTitleList.forEach((element) {});
  }

  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      itemCount: _list.length,
      itemBuilder: (BuildContext context, int index) {
        TabModel _tabModel = _list[index];

        Color bgColor = Colors.grey[200]!;
        Color borderColor = Colors.grey[200]!;
        Color textColor = Colors.black;
        if (_tabModel.select) {
          bgColor = Colors.white;
          borderColor = Colors.blueAccent;
          textColor = Colors.blueAccent;
        }

        return Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (_tabModel.select) {
                    return;
                  }
                  int selectIndex = 0;
                  for (int i = 0; i < _list.length; i++) {
                    TabModel element = _list[i];
                    String title = element.title;
                    String clickTitle = _tabModel.title;
                    if (title == clickTitle) {
                      element.select = true;
                      selectIndex = i;
                    } else {
                      element.select = false;
                    }
                  }
                  double offset = _scrollController.offset;
                  if (selectIndex <= 2) {
                    _scrollController.animateTo(
                      0.0,
                      duration: Duration(milliseconds: 400),
                      curve: Curves.linear,
                    );
                  } else if (selectIndex > 2 &&
                      selectIndex < _list.length - 3) {
                    if (selectIndex > _currentIndex) {
                      //向左滑动
                      _scrollController.animateTo(
                        offset + 80.0 + (selectIndex - _currentIndex - 1) * 80,
                        duration: Duration(milliseconds: 400),
                        curve: Curves.linear,
                      );
                    } else {
                      //向右滑动
                      _scrollController.animateTo(
                        offset - 60,
                        duration: Duration(milliseconds: 400),
                        curve: Curves.linear,
                      );
                    }
                  } else {
                    double max = _scrollController.position.maxScrollExtent;
                    _scrollController.animateTo(
                      max,
                      duration: Duration(milliseconds: 400),
                      curve: Curves.linear,
                    );
                  }
                  _currentIndex = selectIndex;

                  setState(() {});
                  if (widget.onTap != null) {
                    widget.onTap(_currentIndex);
                  }
                },
                child: Container(
                  padding:
                  EdgeInsets.only(left: 12, right: 12, top: 2, bottom: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    //背景
                    color: bgColor,
                    //边框
                    border: Border.all(color: borderColor),
                  ),
                  child: Text(
                    "${_tabModel.title}",
                    style: TextStyle(color: textColor),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class TabModel {
  String title;
  int id;

  //true 为选中
  bool select;

  TabModel({required this.id, required this.title, this.select = false});
}


class MapScreen extends StatefulWidget {
  const MapScreen({ Key? key }) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}