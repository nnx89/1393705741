import 'package:flutter/material.dart';
import 'utils/map.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initMapSDK();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Who\'s Here',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    BMFCoordinate(23.49, 111.28);
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: MapWidget(
          mapOptions: BMFMapOptions(
              center: BMFCoordinate(23.49, 111.28),
              zoomLevel: 18,
              maxZoomLevel: 18,
              mapPadding:
                  BMFEdgeInsets(left: 30, top: 0, right: 30, bottom: 0)),
          overlays: [
            MapOverlay(
                coordinate: BMFCoordinate(23.49, 111.28),
                child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.red,
                ))
          ],
        ),
      ),
    );
  }
}
