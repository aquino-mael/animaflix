import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/app.dart';
import '../../../controllers/controllers.dart';
import '../../mixins/mixins.dart';

class SplashScreen extends GetView<SplashController> with StatusBarManager {
  static const String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    hidenStatusBar();

    return Material(
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: .0, end: 1.0),
        duration: Duration(
          seconds: 2,
        ),
        onEnd: controller.navigateToHome,
        builder: (BuildContext context, double value, Widget? child) {
          return Opacity(
            opacity: value,
            child: Image.asset(
              AppImages.appIcon,
            ),
          );
        },
      ),
    );
  }
}
