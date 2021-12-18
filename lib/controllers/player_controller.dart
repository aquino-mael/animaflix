import 'dart:async';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PlayerController extends GetxController {
  final _showPlayerInterface = true.obs;

  WebViewController? webViewController;

  bool get showPlayerInterface => _showPlayerInterface.value;
  set showPlayerInterface(bool value) => _showPlayerInterface.value = value;

  Timer? timer;

  @override
  void onInit() {
    super.onInit();
    _setTimerToHidenInterface();
  }

  @override
  void onClose() {
    super.onClose();
    timer!.cancel();
  }

  Future<void> shouldShowInterface() async {
    _showPlayerInterface.value = !showPlayerInterface;
    _setTimerToHidenInterface();
  }

  void _setTimerToHidenInterface() {
    if(timer != null && timer?.isActive == true) {
      timer!.cancel();
    }

    timer = Timer(Duration(seconds: 3), () async {
      _showPlayerInterface.value = false;
      timer!.cancel();
    });
  }
}
