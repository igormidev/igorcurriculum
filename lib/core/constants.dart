import 'package:dart_debouncer/dart_debouncer.dart';

class Constants {
  static const double screenWidth = 640;
  static const double desktopSectionsWidth = 610;
  static const double desktopBreakpoint = screenWidth + desktopSectionsWidth;
  static const double contentMaxWidth = 1380;
  static bool isMobileSize = false;
  bool get isMobile => isMobileSize;

  /// <========= About me =========>
  static final Duration profileHeaderDelay = 1300.milliseconds;
  static final Duration howIcanHelpYouDelay = 1800.milliseconds;
  static final Duration contactGrid = 2800.milliseconds;
}
