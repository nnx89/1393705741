import 'dart:async';

import 'package:amap_flutter_map/amap_flutter_map.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:whoshere/controller/user_state_controller.dart';
import 'package:whoshere/service/services.dart';
import 'package:whoshere/widgets/MapOverlay.dart';
import 'package:whoshere/widgets/MapView.dart';
import 'package:whoshere/mock/mockMapOverLays.dart';
import 'package:whoshere/mock/mockTagList.dart';
import 'package:whoshere/widgets/TagSelector.dart';
import 'package:whoshere/widgets/SearchBarDelegate.dart';
import 'package:whoshere/widgets/FilledIconButton.dart';
import 'package:whoshere/page/profile_page.dart';
import 'package:whoshere/widgets/decorated_bubble.dart';
import 'package:whoshere/widgets/tapbar.dart';
import 'package:amap_flutter_base/amap_flutter_base.dart';
import 'package:whoshere/utils/navigating.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late VoidCallback _showPersistantBottomSheetCallBack;

  final IUserLocationService userLocationService = Get.find();
  final IUserService userService = Get.find();
  final UserStateController stateController = Get.find();
  AMapController? mapController;
  Completer mapControllerCompleter = Completer();

  int _selectedTagIndex = 0;
  bool firstLocationUpdate = true;

  @override
  void initState() {
    super.initState();
    _showPersistantBottomSheetCallBack = _showBottomSheet;
    onLoad();
  }

  Future ensurePermission() async {
    bool granted = false;
    while (!granted) {
      await Permission.locationWhenInUse.request();
      var locationPermission = await Permission.locationWhenInUse.status;
      if (locationPermission.isGranted) {
        granted = true;
      } else {
        String reason;
        switch (locationPermission) {
          case PermissionStatus.granted:
            throw StateError("This case show not be reached");
          case PermissionStatus.permanentlyDenied:
          case PermissionStatus.denied:
          case PermissionStatus.limited:
            reason = "You have denied the location permission.";
            break;
          case PermissionStatus.restricted:
            reason =
                "The operating system have denied the location permission.";
            break;
        }
        await showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text(
                      "You must enable location service (GPS) to use this app."),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: [
                        Text(reason),
                        const SizedBox(
                          height: 6,
                        ),
                        const Text(
                            "Please change your permission settings, then click the \"Try Again\" button."),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          openAppSettings();
                        },
                        child: const Text("Permission Settings")),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Try Again"))
                  ],
                ));
      }
    }
  }

  void onLocationUpdate(LatLng location) {
    stateController.currentUser.update((user) {
      user!.location = location;
    });
    if (firstLocationUpdate && mapControllerCompleter.isCompleted) {
      assert(mapController != null,
          "mapController should have been created at this state");
      mapController!.moveCamera(CameraUpdate.newLatLngZoom(location, 16));
      firstLocationUpdate = false;
    }
  }

  void onMapControllerCreated(AMapController controller) {
    mapController = controller;
    mapControllerCompleter.complete();
  }

  void onLoad() async {
    await ensurePermission();
    userLocationService.onLocationUpdate.listen(onLocationUpdate);
    userLocationService.startLocationUpdate();
  }

  void _showBottomSheet() {
    setState(() {
      _showPersistantBottomSheetCallBack = () {};
    });

    _scaffoldKey.currentState
        ?.showBottomSheet((context) {
          return tapBar2();
        })
        .closed
        .whenComplete(() {
          // controller broadcast

          if (mounted) {
            setState(() {
              _showPersistantBottomSheetCallBack = _showBottomSheet;
            });
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).viewPadding.top;
    double windowWidth = MediaQuery.of(context).size.width;

    var mapView = Obx(() {
      List<MapOverlay> overlays = [];
      if (stateController.currentUser.value != null) {
        overlays.add(MapOverlay(
          coordinate: stateController.currentUser.value!.location,
          child: DecoratedBubble(
            bubbleStyle: 1,
            emoji: '😅',
            tag: 'current_user',
            onTap: () => openBubbleSertting(context,
                bubbleStyle: 1, emoji: '😅', tag: 'current_user'),
            onMap: true,
          ),
        ));
      }

      return MapView(
        mapCreatedCallback: onMapControllerCreated,
        overlays: overlays,
      );
    });

    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          mapView,
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
                      splashColor: const Color.fromARGB(255, 0, 0, 255),
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
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                ),
              ))
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}