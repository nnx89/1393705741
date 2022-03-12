import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map.dart';

void setAK() {
  if (Platform.isIOS) {
    BMFMapSDK.setApiKeyAndCoordType(
        'SyaWCruyXEYo48uB9BqDfaCIWAvZwrQn', BMF_COORD_TYPE.BD09LL);
  } else if (Platform.isAndroid) {
// Android 目前不支持接口设置Apikey,
// 请在主工程的Manifest文件里设置，详细配置方法请参考[https://lbs.baidu.com/ 官网][https://lbs.baidu.com/)demo
    BMFMapSDK.setCoordType(BMF_COORD_TYPE.BD09LL);
  }
}

class MapManager {
  static BMFMapOptions mapOptions = BMFMapOptions(
      center: BMFCoordinate(39.917215, 116.380341),
      zoomLevel: 12,
      mapPadding: BMFEdgeInsets(left: 30, top: 0, right: 30, bottom: 0));

  static BMFMapController mapContoller;

  static Widget createMap(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: screenSize.height,
      width: screenSize.width,
      child: BMFMapWidget(
        onBMFMapCreated: (controller) {
          // onBMFMapCreated(controller);
        },
        mapOptions: mapOptions,
      ),
    );
  }
}

class MapWidget extends StatelessWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MapManager.createMap(context);
  }
}
