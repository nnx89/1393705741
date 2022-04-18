import 'dart:convert';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:whos_here/utils/controller.dart';

class emojiWidget extends StatelessWidget {
  const emojiWidget({Key? key}) : super(key: key);

  _onEmojiSelected(Emoji emoji){
    emojiChoosingController.add(emoji.emoji);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: Container(
        child:
             EmojiPicker(
                onEmojiSelected: (category, Emoji emoji) {
                  print(emoji);
                  _onEmojiSelected(emoji);
                },
                // onBackspacePressed: _onBackspacePressed,
                config: Config(
                    columns: 7,
                    emojiSizeMax: 32,
                    verticalSpacing: 0,
                    horizontalSpacing: 0,
                    // initCategory: Category.RECENT,
                    bgColor: const Color(0xFFF2F2F2),
                    indicatorColor: Colors.blue,
                    iconColor: Colors.grey,
                    iconColorSelected: Colors.blue,
                    progressIndicatorColor: Colors.blue,
                    backspaceColor: Colors.blue,
                    skinToneDialogBgColor: Colors.white,
                    skinToneIndicatorColor: Colors.grey,
                    enableSkinTones: true,
                    showRecentsTab: false,
                    recentsLimit: 28,
                    tabIndicatorAnimDuration: kTabScrollDuration,
                    categoryIcons: const CategoryIcons(),
                    buttonMode: ButtonMode.MATERIAL)),


      ),
    );
  }
// }
}
