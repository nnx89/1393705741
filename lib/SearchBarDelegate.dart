import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

List HistorySearch = [
  '暑假',
  '足球',
  '男生',
  '女生',
  '音乐'
];
//热搜
List HotSearch = [
  'xjtlu',
  '隔离中',
  '未返校',
  'ics',
  '大三',
];
//标签库
const TagLibrary = [
  '暑假',
  '寒假',
  '男生',
  '女生',
  'xjtlu',
  '隔离中',
  '未返校',
  'ics',
  '大三',
  '标签1',
  '标签2',
  '标签3',
  '标签4',
  "摇滚",
  "音乐",
  "游戏党",
  "工程师",
  "下棋",
  "Python",
  "足球",
  "测试",
  "篮球",
  "摄影",
  "集邮",
  "读书",
];
typedef SearchItemCall = void Function(String item);

class SearchBarDelegate extends SearchDelegate {

  @override
  List <Widget> buildActions(BuildContext context) {
    //右侧显示内容 这里放清除按钮
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //左侧显示内容 这里放了返回按钮
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        if (query.isEmpty) {
          close(context, null);
        } else {
          query = "";
          showSuggestions(context);
        }
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //点击了搜索后显示的页面
    HistorySearch.insert(0,query);
    if(HistorySearch.length>5 ){
      HistorySearch.removeLast();
    }
    if(TagLibrary.contains(query)==false){
      return Center(
        child: Text("抱歉，您搜索的标签不存在"),
      );
    }
    else{
      return AlertDialog(
        title: Text('确认加该标签吗?'),
        actions: <Widget>[
          FlatButton(child: Text('取消'),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
          FlatButton(child: Text('确认'),
            onPressed: (){
              // 向服务器传输TAG名称
              postRequest(query);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    }

  }

  //设置推荐
  @override
  Widget buildSuggestions(BuildContext context){
    //不输入则展示热搜和历史记录
    if(query==""){
      return SearchContentView();
    }
    //推荐搜索
    else{
      final suggestionsList= query.isEmpty
          ? HistorySearch
          : TagLibrary.where((input)=> input.startsWith(query)).toList();
      return ListView.builder(
        itemCount:suggestionsList.length,
        itemBuilder: (context,index) => ListTile(
          title: RichText( //富文本
            text: TextSpan(
                text: suggestionsList[index].substring(0,query.length),
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                recognizer: TapGestureRecognizer()//点击模糊推荐后的事件
                  ..onTap =() {
                    query = suggestionsList[index];
                  },
                children: [
                  TextSpan(
                    text: suggestionsList[index].substring(query.length),
                    style: TextStyle(color: Colors.grey),
                    recognizer: TapGestureRecognizer()
                      ..onTap =() {
                        query = suggestionsList[index];
                      },
                  )
                ]
            ),
          ),
        ),
      );
    }
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return super.appBarTheme(context);
  }
}


class SearchContentView extends StatefulWidget {
  @override
  _SearchContentViewState createState() => _SearchContentViewState();
}

class _SearchContentViewState extends State {


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              '热搜',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Divider(),
          Wrap(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(233, 233, 233, 0.9),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(HotSearch[0]),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(233, 233, 233, 0.9),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(HotSearch[1]),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(233, 233, 233, 0.9),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(HotSearch[2]),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(233, 233, 233, 0.9),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(HotSearch[3]),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(233, 233, 233, 0.9),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(HotSearch[4]),
              ),
            ],
          ),
          SizedBox(height: 10,),
          //SearchItemView(),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              '历史记录',
              style: TextStyle(fontSize: 16),
            ),
          ),
          //SearchItemView()
          Divider(),
          Wrap(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(233, 233, 233, 0.9),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(HistorySearch[0]),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(233, 233, 233, 0.9),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(HistorySearch[1]),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(233, 233, 233, 0.9),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(HistorySearch[2]),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(233, 233, 233, 0.9),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(HistorySearch[3]),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(233, 233, 233, 0.9),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(HistorySearch[4]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
//get请求
void getRequest() async {
  try {
    var response = await Dio().get('http://www.baidu.com');
    print(response);
  } catch (e) {
    print(e);
  }
}
///post请求发送json
void postRequest(TagID) async{
  String url = "http://www.baidu.com";
  ///创建Dio
  Dio dio = new Dio();
  ///创建Map 封装参数
  Map<String,dynamic> map = Map();
  map['UserID']="小明";
  map['TagID']=TagID;
  map['TagState']=true;

  ///发起post请求
  Response response =  await dio.post(url,data: map);

  var data = response.data;
}