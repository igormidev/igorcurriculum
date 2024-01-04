import 'package:dart_debouncer/dart_debouncer.dart';

class Constants {
  static const double screenWidth = 600;
  static bool isMobileSize = false;
  bool get isMobile => isMobileSize;

  /// <========= About me =========>
  static final Duration profileHeaderDelay = 1300.milliseconds;
  static final Duration howIcanHelpYouDelay = 1800.milliseconds;
  static final Duration contactGrid = 2800.milliseconds;

  /// <========= Packages
  static final Duration myPublicPackagesHeaderDelay =
      howIcanHelpYouDelay + 1000.milliseconds;
  static final Duration myPublicPackagesSubtitleDelay =
      howIcanHelpYouDelay + 1000.milliseconds;
  static final Duration packageCardDelay =
      howIcanHelpYouDelay + 1300.milliseconds;

  // <========= Experience =========>
  static final Duration myExperiencePackagesHeaderDelay =
      myPublicPackagesHeaderDelay + 600.milliseconds;
  static final Duration myExperienceagesSubtitleDelay =
      myPublicPackagesSubtitleDelay + 600.milliseconds;
  static final Duration experienceCardDelay =
      packageCardDelay + 600.milliseconds;

  // <========= More =========>.
  static final Duration sourceCodeOfSize = 3000.milliseconds;
}
