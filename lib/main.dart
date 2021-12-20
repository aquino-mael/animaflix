import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ui/widgets/widgets.dart';

void main() {
  return runZonedGuarded<void>(() {
    	return runApp(
        Animaflix(),
      );
  }, (error, stackTrace) {
    log(error.toString(), name: "APP ERROR");
    Get.snackbar(
      'Ocorreu um erro inesperado',
      error.toString(),
      snackPosition: SnackPosition.BOTTOM,
    );
  });
}
