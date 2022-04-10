import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map.dart';

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
  List<Widget> visibleOverlays = [];
  late Size parentSize;

  void onDrawMapFrame(BMFMapStatus mapStatus) {
    assert(mapStatus.coordinateBounds != null);

    if (widget.overlays == null) {
      return;
    }
    var visibleOverlays = <Widget>[];
    for (MapOverlay overlay in widget.overlays!) {
      if (mapStatus.coordinateBounds!.southwest.latitude <=
              overlay.coordinate.latitude &&
          overlay.coordinate.latitude <=
              mapStatus.coordinateBounds!.northeast.latitude &&
          mapStatus.coordinateBounds!.southwest.longitude <=
              overlay.coordinate.longitude &&
          overlay.coordinate.longitude <=
              mapStatus.coordinateBounds!.northeast.longitude) {
        double latitudeHeight = mapStatus.coordinateBounds!.northeast.latitude -
            mapStatus.coordinateBounds!.southwest.latitude;
        double longitudeWidth =
            mapStatus.coordinateBounds!.northeast.longitude -
                mapStatus.coordinateBounds!.southwest.longitude;
        double xFactor = parentSize.width / longitudeWidth;
        double yFactor = parentSize.height / latitudeHeight;

        visibleOverlays.add(Positioned(
          child: overlay,
          left: (overlay.coordinate.longitude -
                  mapStatus.coordinateBounds!.southwest.longitude) *
              xFactor,
          bottom: (overlay.coordinate.latitude -
                  mapStatus.coordinateBounds!.southwest.latitude) *
              yFactor,
        ));
      }
    }
    setState(() {
      this.visibleOverlays = visibleOverlays;
    });
    print(
        "${mapStatus.coordinateBounds?.northeast.latitude}    ${mapStatus.coordinateBounds?.northeast.longitude}");
  }

  @override
  Widget build(BuildContext context) {
    parentSize = MediaQuery.of(context).size;
    var children = [
      BMFMapWidget(
        onBMFMapCreated: (controller) {
          controller.setMapOnDrawMapFrameCallback(callback: onDrawMapFrame);
          controller.addDot(BMFDot(
              center: BMFCoordinate(23.494269954413255, 111.2856977305498),
              radius: 10,
              color: Colors.amber));
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
      )
    ];

    children.addAll(visibleOverlays);

    return Stack(
      children: children,
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
