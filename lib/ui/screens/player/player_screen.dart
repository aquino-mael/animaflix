import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../controllers/controllers.dart';
import '../../mixins/mixins.dart';

const kPositionDuration = Duration(
  milliseconds: 500,
);

class PlayerScreen extends GetView<PlayerController> with ScreenManager, StatusBarManager {
  final String episodeName;
  final String episodeUrl;

  PlayerScreen({
    required this.episodeName,
    required this.episodeUrl,
  });

  @override
  Widget build(BuildContext context) {
    setScreenOrientation([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);

    return WillPopScope(
      onWillPop: () async {
        setDefaultScreenOrientation();
        return true;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            SafeArea(
              top: false,
              child: GestureDetector(
                onDoubleTap: () {
                  controller.shouldShowInterface();
                },
                child: WebView(
                  initialUrl: episodeUrl,
                  javascriptMode: JavascriptMode.unrestricted,
                  gestureNavigationEnabled: true,
                  allowsInlineMediaPlayback: true,
                  onWebViewCreated: (webViewController) {
                    controller.webViewController = webViewController;
                  },
                  initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
                ),
              ),
            ),
            Obx(() => AnimatedPositioned(
              top: controller.showPlayerInterface
                ? 0.0
                : -100,
              left: 0.0,
              right: 0.0,
              duration: kPositionDuration,
              child: AppBar(
                elevation: .0,
                backgroundColor: Colors.black45,
                title: Text(
                  episodeName,
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
