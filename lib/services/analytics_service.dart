import 'package:dart_debouncer/dart_debouncer.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';

class AnalyticsService {
  static AnalyticsService? _instance;
  // Avoid self instance
  AnalyticsService._() : _firebaseAnalytics = FirebaseAnalytics.instance;
  static AnalyticsService get instance => _instance ??= AnalyticsService._();

  final FirebaseAnalytics _firebaseAnalytics;

  final List<String> _alreadyLogged = [];
  void logContact(String contactName) {
    final alreadyLoggedThisContact = _alreadyLogged.contains(contactName);
    if (kDebugMode || alreadyLoggedThisContact) return;
    _alreadyLogged.add(contactName);
    _firebaseAnalytics.logEvent(
      name: 'tap_contact_$contactName',
    );
  }

  void logOpenedPackage(String packageName) {
    final alreadyLoggedThisContact = _alreadyLogged.contains(packageName);
    if (kDebugMode || alreadyLoggedThisContact) return;
    _alreadyLogged.add(packageName);
    _firebaseAnalytics.logEvent(
      name: 'opened_package_$packageName',
    );
  }

  void logOpenedLiveDemo(String demoName) {
    final alreadyLoggedThisContact = _alreadyLogged.contains(demoName);
    if (kDebugMode || alreadyLoggedThisContact) return;
    _alreadyLogged.add(demoName);
    _firebaseAnalytics.logEvent(
      name: 'opened_demo_$demoName',
    );
  }

  final Debouncer _debouncerChangeColor = Debouncer(timerDuration: 3.seconds);
  void usedChangeColorFeature(String demoName) {
    if (kDebugMode) return;
    _debouncerChangeColor.resetDebounce(() {
      _firebaseAnalytics.logEvent(
        name: 'used_change_color_feature',
      );
    });
  }

  final Debouncer _debouncerChangeLight = Debouncer(timerDuration: 3.seconds);
  void usedChangeLightningFeature(String demoName) {
    if (kDebugMode) return;
    _debouncerChangeLight.resetDebounce(() {
      _firebaseAnalytics.logEvent(
        name: 'used_change_lightning_feature',
      );
    });
  }

  void openedSiteRepository() {
    if (kDebugMode) return;
    final alreadyLoggedThisContact =
        _alreadyLogged.contains('repositoryOpened');
    if (kDebugMode || alreadyLoggedThisContact) return;
    _alreadyLogged.add('repositoryOpened');
    _firebaseAnalytics.logEvent(
      name: 'opened_site_repository',
    );
  }
}
