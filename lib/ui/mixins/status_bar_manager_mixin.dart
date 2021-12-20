import 'package:flutter/services.dart';

mixin StatusBarManager {
  Future<void> hidenStatusBar() async {
    return SystemChrome.setEnabledSystemUIOverlays([]);
  }

  Future<void> showStatusBar() async {
    return SystemChrome.setEnabledSystemUIOverlays([
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ]);
  }
}
