import 'dart:io';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map.dart';

import 'map_util.dart';

void initMapSDK() {
  if (Platform.isIOS) {
    BMFMapSDK.setApiKeyAndCoordType(
        'SyaWCruyXEYo48uB9BqDfaCIWAvZwrQn', BMF_COORD_TYPE.BD09LL);
  } else if (Platform.isAndroid) {
// Android 目前不支持接口设置Apikey,
// 请在主工程的Manifest文件里设置，详细配置方法请参考[https://lbs.baidu.com/ 官网][https://lbs.baidu.com/)demo
    BMFMapSDK.setCoordType(BMF_COORD_TYPE.BD09LL);
  }
}

class MapWidget extends StatefulWidget {
  const MapWidget({Key? key, required this.mapOptions, this.overlays})
      : super(key: key);

  final BMFMapOptions mapOptions;
  final List<MapOverlay>? overlays;

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late Size parentSize;

  List<Widget> visibleOverlays = [];

  bool _isInRange(BMFCoordinate pos, BMFCoordinateBounds bound) {
    // return bound.southwest.latitude <= pos.latitude &&
    //     pos.latitude <= bound.northeast.latitude &&
    //     bound.southwest.longitude <= pos.longitude &&
    //     pos.longitude <= bound.northeast.longitude;
    return true;
  }

  void onDrawMapFrame(BMFMapStatus mapStatus) {
    if (widget.overlays == null) {
      return;
    }
    assert(mapStatus.coordinateBounds != null);

    print("Rotation: ${mapStatus.fRotation}");
    print(
        "Northeast: ${mapStatus.coordinateBounds!.northeast.latitude}    ${mapStatus.coordinateBounds!.northeast.longitude}");
    print(
        "Southwest: ${mapStatus.coordinateBounds!.southwest.latitude}    ${mapStatus.coordinateBounds!.southwest.longitude}");
    var visibleOverlays = <Widget>[];
    for (MapOverlay overlay in widget.overlays!) {
      if (_isInRange(overlay.coordinate, mapStatus.coordinateBounds!)) {
        var point = convertGeoCoordToScreenCoord(
            overlay.coordinate, mapStatus.coordinateBounds!, parentSize);
        print("Overlay Pos: ${point.x}  ${point.y}");
        visibleOverlays.add(Positioned(
          child: overlay,
          left: point.x.toDouble(),
          bottom: point.y.toDouble(),
        ));
      }
    }
    setState(() {
      this.visibleOverlays = visibleOverlays;
    });

    print("==============");
  }

  @override
  Widget build(BuildContext context) {
    parentSize = MediaQuery.of(context).size;

    return Stack(
      children: [
        BMFMapWidget(
          onBMFMapCreated: (controller) {
            controller.setMapOnDrawMapFrameCallback(callback: onDrawMapFrame);
            controller.addDot(BMFDot(
                center: BMFCoordinate(23.494269954413255, 111.2856977305498),
                radius: 10,
                color: Colors.amber));
            controller.
          },
          mapOptions: widget.mapOptions,
        ),
        Positioned(
          child: Container(
            height: 50,
            width: 50,
            color: Colors.green,
          ),
          right: 50,
          bottom: 50,
        ),
        Stack(
          children: visibleOverlays,
        )
      ],
    );
  }
}

class MapOverlay extends StatelessWidget {
  const MapOverlay({Key? key, required this.coordinate, required this.child})
      : super(key: key);

  final BMFCoordinate coordinate;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
