import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/app.dart';
import '../../cross_cutting/cross_cutting.dart';
import '../screens/screens.dart';

class Animaflix extends StatelessWidget {
  const Animaflix({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: SplashScreen.routeName,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.backgroundColor,
      ),
      getPages: [
        GetPage(
          name: SplashScreen.routeName,
          page: () => SplashScreen(),
          binding: SplashBinding()
        ),
      ],
    );
  }
}
