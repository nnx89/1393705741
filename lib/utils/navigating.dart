import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:whoshere/model/user.dart';
import 'package:whoshere/page/bubble_setting_page.dart';
import 'package:whoshere/page/friend_page.dart';
import 'package:whoshere/page/stranger_page.dart';

void openFriendPage(BuildContext context, Rx<User> friend) {
  CupertinoScaffold.showCupertinoModalBottomSheet(
      context: context,
      builder: (context) => friendPage(friend),
      enableDrag: true,
      expand: true,
      backgroundColor: Colors.grey);
}

void openStrangerPage(BuildContext context) {
  CupertinoScaffold.showCupertinoModalBottomSheet(
      context: context,
      builder: (context) => strangerPage(),
      enableDrag: true,
      expand: true,
      backgroundColor: Colors.grey);
}

void openBubbleSertting(BuildContext context,
    {required int bubbleStyle, String emoji = '', required String tag}) {
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))),
    context: context,
    builder: (context) =>
        BubbleSettingPage(bubbleStye: bubbleStyle, emoji: emoji, tag: tag),
    isScrollControlled: false,
    enableDrag: true,
  );
}
