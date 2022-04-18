import 'dart:async';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

StreamController<Color> colorStreamController = StreamController.broadcast();
StreamController<int> childPageStreamController = StreamController.broadcast();
StreamController<Color> color2StreamController = StreamController.broadcast();
StreamController<int> typeChoosingController = StreamController.broadcast();
StreamController<String> emojiChoosingController = StreamController.broadcast();