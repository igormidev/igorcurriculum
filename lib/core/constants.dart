import 'package:dart_debouncer/dart_debouncer.dart';

class Constants {
  static const double screenWidth = 600;
  static bool isMobileSize = false;
  bool get isMobile => isMobileSize;

  /// <========= About me =========>
  static final Duration profileHeaderDelay = 1300.milliseconds;
  static final Duration howIcanHelpYouDelay = 1800.milliseconds;
  static final Duration contactGrid = 2800.milliseconds;
}
