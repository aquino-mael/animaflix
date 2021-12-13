import 'package:get/get.dart';

import '../ui/screens/screens.dart';

class SplashController extends GetxController implements ISplashController {
  @override
  void navigateToHome() {
    Get.offAllNamed<void>(HomeScreen.routeName);
  }
}
