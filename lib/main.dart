import 'dart:async';

import 'package:flutter/material.dart';

import 'ui/widgets/widgets.dart';

void main() {
  return runZonedGuarded<void>(() {
    	return runApp(
        Animaflix(),
      );
  }, (error, stackTrace) {

  });
}
