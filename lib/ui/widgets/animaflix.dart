import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/app.dart';
import '../../cross_cutting/bindings/bindings.dart';
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
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.red
        )
      ),
      darkTheme: ThemeData(
        primaryColor: AppColors.primaryColor,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.red,
          brightness: Brightness.dark,
        ),
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
      ],
    );
  }
}
