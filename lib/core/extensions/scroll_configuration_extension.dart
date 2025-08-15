import 'dart:ui';

import 'package:flutter/material.dart';

extension ScrollConfigurationExtension on Widget {
  /// تخصيص ScrollBehavior مع أجهزة السحب المطلوبة
  Widget withScrollConfiguration({
    Set<PointerDeviceKind> dragDevices = const {
      PointerDeviceKind.touch,
      PointerDeviceKind.mouse,
      PointerDeviceKind.trackpad,
    },
  }) {
    return Builder(
      builder: (context) {
        return ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: dragDevices,
          ),
          child: this,
        );
      },
    );
  }
}