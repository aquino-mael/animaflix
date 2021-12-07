import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'ui/widgets/widgets.dart';

void main() {
  return runZonedGuarded<void>(() {
    	return runApp(
        Animaflix(),
      );
  }, (error, stackTrace) {
    log(stackTrace.toString(), error: error, name: "APP ERROR");
  });
}
