import 'package:flutter/services.dart';

mixin StatusBarManager {
  Future<void> hidenStatusBar() {
    return SystemChrome.setEnabledSystemUIOverlays([]);
  }

  Future<void> showStatusBar() {
    return SystemChrome.setEnabledSystemUIOverlays([
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ]);
  }
}
