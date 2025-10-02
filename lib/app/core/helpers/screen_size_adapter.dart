import 'dart:io';

import 'package:flutter/widgets.dart';

class ScreenSizeAdapter {
  ScreenSizeAdapter();

  bool isMobile(double width) {
    return width < 600;
  }

  bool isTablet(double width) {
    return width >= 600 && width < 1200;
  }

  bool isDesktop(double width) {
    return width >= 1200;
  }

  TargetPlatform getPlatformType() {
    if (Platform.isAndroid) {
      return TargetPlatform.android;
    } else if (Platform.isIOS) {
      return TargetPlatform.iOS;
    } else if (Platform.isWindows) {
      return TargetPlatform.windows;
    } else if (Platform.isMacOS) {
      return TargetPlatform.macOS;
    } else if (Platform.isLinux) {
      return TargetPlatform.linux;
    } else {
      return TargetPlatform.fuchsia;
    }
  }

  static getMobile(double width) {
    return width < 600;
  }
}
