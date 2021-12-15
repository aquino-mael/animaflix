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
      title: 'AnimaFlix',
      initialRoute: SplashScreen.routeName,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
        ),
      ),
      darkTheme: ThemeData(
        primaryColor: AppColors.primaryColor,
        brightness: Brightness.dark,
      ),
      getPages: [
        GetPage(
          name: SplashScreen.routeName,
          page: () => SplashScreen(),
          binding: SplashBinding()
        ),
        GetPage(
          name: HomeScreen.routeName,
          page: () => HomeScreen(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: DetailsScreen.routeName,
          page: () => DetailsScreen(),
          binding: DetailsBinding(),
        ),
      ],
    );
  }
}
