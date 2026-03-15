import 'package:dart_debouncer/dart_debouncer.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class AnalyticsService {
  static AnalyticsService? _instance;
  // Avoid self instance
  AnalyticsService._();
  static AnalyticsService get instance => _instance ??= AnalyticsService._();

  FirebaseAnalytics? _firebaseAnalytics;

  FirebaseAnalytics? get _analytics {
    if (kDebugMode) return null;
    if (_firebaseAnalytics != null) return _firebaseAnalytics;
    if (Firebase.apps.isEmpty) return null;
    try {
      _firebaseAnalytics = FirebaseAnalytics.instance;
    } catch (_) {
      return null;
    }
    return _firebaseAnalytics;
  }

  void _logEvent(String name) {
    final analytics = _analytics;
    if (analytics == null) return;
    analytics.logEvent(name: name);
  }

  final List<String> _alreadyLogged = [];
  void logContact(String contactName) {
    final alreadyLoggedThisContact = _alreadyLogged.contains(contactName);
    if (kDebugMode || alreadyLoggedThisContact) return;
    _alreadyLogged.add(contactName);
    _logEvent('tap_contact_$contactName');
  }

  void logOpenedPackage(String packageName) {
    final alreadyLoggedThisContact = _alreadyLogged.contains(packageName);
    if (kDebugMode || alreadyLoggedThisContact) return;
    _alreadyLogged.add(packageName);
    _logEvent('opened_package_$packageName');
  }

  void logOpenedLiveDemo(String demoName) {
    final alreadyLoggedThisContact = _alreadyLogged.contains(demoName);
    if (kDebugMode || alreadyLoggedThisContact) return;
    _alreadyLogged.add(demoName);
    _logEvent('opened_demo_$demoName');
  }

  final Debouncer _debouncerChangeColor = Debouncer(timerDuration: 3.seconds);
  void usedChangeColorFeature(String demoName) {
    if (kDebugMode) return;
    _debouncerChangeColor.resetDebounce(() {
      _logEvent('used_change_color_feature');
    });
  }

  final Debouncer _debouncerChangeLight = Debouncer(timerDuration: 3.seconds);
  void usedChangeLightningFeature(String demoName) {
    if (kDebugMode) return;
    _debouncerChangeLight.resetDebounce(() {
      _logEvent('used_change_lightning_feature');
    });
  }

  void openedSiteRepository() {
    if (kDebugMode) return;
    final alreadyLoggedThisContact =
        _alreadyLogged.contains('repositoryOpened');
    if (kDebugMode || alreadyLoggedThisContact) return;
    _alreadyLogged.add('repositoryOpened');
    _logEvent('opened_site_repository');
  }
}
