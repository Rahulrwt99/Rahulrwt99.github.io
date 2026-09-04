import 'package:flutter/widgets.dart';

abstract class Breakpoints {
  static const mobile = 680.0;
  static const tablet = 1024.0;
  static const wide = 1280.0;
}

extension ResponsiveContext on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;
  bool get isMobile => screenWidth < Breakpoints.mobile;
  bool get isTablet =>
      screenWidth >= Breakpoints.mobile && screenWidth < Breakpoints.tablet;
  bool get isDesktop => screenWidth >= Breakpoints.tablet;

  double get pageGutter {
    if (screenWidth < Breakpoints.mobile) return 20;
    if (screenWidth < Breakpoints.tablet) return 40;
    return 56;
  }
}
