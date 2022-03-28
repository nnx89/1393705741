import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AvatarView Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  // final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
           title: Text("bubble"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// 1. Circular AvatarView Without Border
              AvatarView(
                radius: 60,
                borderColor: Colors.yellow,
                isOnlyText: false,
                text: Text('C', style: TextStyle(color: Colors.white, fontSize: 50),),
                avatarType: AvatarType.CIRCLE,
                backgroundColor: Colors.red,
                imagePath:
                "images/10001.jpg",
                placeHolder: Container(
                  child: Icon(Icons.person, size: 50,),
                ),
                errorWidget: Container(
                  child: Icon(Icons.error, size: 50,),
                ),
              ),
              SizedBox(height: 16,),
              /// 2. Circular AvatarView With Border
              AvatarView(
                radius: 60,
                borderWidth: 8,
                borderColor: Colors.yellow,
                avatarType: AvatarType.CIRCLE,
                backgroundColor: Colors.red,
                imagePath:
                "images/10001.jpg",
                placeHolder: Container(
                  child: Icon(Icons.person, size: 50,),
                ),
                errorWidget: Container(
                  child: Icon(Icons.error, size: 50,),
                ),
              ),
              SizedBox(height: 16,),
              /// 3. Rectangular AvatarView Without Border
              AvatarView(
                radius: 60,
                borderColor: Colors.grey,
                avatarType: AvatarType.RECTANGLE,
                backgroundColor: Colors.red,
                imagePath:    "images/10001.jpg",
                placeHolder: Container(
                  child: Icon(Icons.person, size: 50,),
                ),
                errorWidget: Container(
                  child: Icon(Icons.error, size: 50,),
                ),
              ),
              SizedBox(height: 16,),
              /// 4. Rectangular AvatarView With Border
              AvatarView(
                radius: 60,
                borderWidth: 8,
                borderColor: Colors.grey,
                avatarType: AvatarType.RECTANGLE,
                backgroundColor: Colors.red,
                imagePath:    "images/10001.jpg",
                placeHolder: Container(
                  child: Icon(Icons.person, size: 50,),
                ),
                errorWidget: Container(
                  child: Icon(Icons.error, size: 50,),
                ),
              ),
              // SizedBox(height: 16,),

            ],
          ),
        ));
  }
}
