import 'dart:io';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ohm_pad_flutter/app/core/constants/adaptive_breakpoints.dart';

enum AdaptiveScreenType {
  mobile,
  webMobile,
  tablet,
  webTablet,
  desktop,
  webDesktop,
}

enum ScreenOrientation {
  landscape,
  portrait,
  none,
}

class PlatformUtils {
  PlatformUtils(MediaQueryData data) {
    _getAdaptiveScreenType(data);
  }

  bool get isAndroid => Platform.isAndroid;

  bool get isIOS => Platform.isIOS;

  bool get isWindows => Platform.isWindows;

  bool get isLinux => Platform.isLinux;

  bool get isMacOS => Platform.isMacOS;

  bool get isWeb => kIsWeb;

  late final AdaptiveScreenType screenType;
  late final ScreenOrientation screenOrientation;
  late final double screenWidth;
  late final double screenHeight;

  void _getAdaptiveScreenType(MediaQueryData data) {
    screenWidth = data.size.width;
    screenHeight = data.size.height;
    Orientation orientation = data.orientation;

    ///setting the device orientation either it is portrait or landscape.
    screenOrientation = orientation == Orientation.portrait
        ? ScreenOrientation.portrait
        : orientation == Orientation.landscape
            ? ScreenOrientation.landscape
            : ScreenOrientation.none;

    if (isWeb) {
      ///isWeb must be the first condition because it uses the kIsWeb from
      ///dart:io
      ///and others use Platform. Platform will not work on web but kIsWeb will
      ///work on others
      if (screenWidth <= AdaptiveBreakPoints.mobileMaxWidth) {
        screenType = AdaptiveScreenType.webMobile;
      } else if (screenWidth > AdaptiveBreakPoints.tabletMinWidth &&
          screenWidth <= AdaptiveBreakPoints.tabletMaxWidth) {
        screenType = AdaptiveScreenType.webTablet;
      } else {
        screenType = AdaptiveScreenType.webDesktop;
      }
    } else if (isWindows) {
      /// Running on Windows
      screenType = AdaptiveScreenType.desktop;
    } else if (isLinux) {
      ///Running on Linux
      screenType = AdaptiveScreenType.desktop;
    } else if (isMacOS) {
      ///Running on MacOs
      screenType = AdaptiveScreenType.desktop;
    } else {
      ///Running on Either Android or Ios
      if (min(screenWidth, screenHeight) > AdaptiveBreakPoints.tabletMinWidth &&
          min(screenWidth, screenHeight) <=
              AdaptiveBreakPoints.tabletMaxWidth) {
        screenType = AdaptiveScreenType.tablet;
      } else {
        screenType = AdaptiveScreenType.mobile;
      }
    }
  }
}
