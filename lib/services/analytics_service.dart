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
  void _logUniqueEvent({
    required String uniqueKey,
    required String eventName,
  }) {
    final alreadyLoggedThisContact = _alreadyLogged.contains(uniqueKey);
    if (kDebugMode || alreadyLoggedThisContact) return;
    _alreadyLogged.add(uniqueKey);
    _logEvent(eventName);
  }

  void logContact(String contactName) {
    _logUniqueEvent(
      uniqueKey: contactName,
      eventName: 'tap_contact_$contactName',
    );
  }

  void logOpenedPackage(String packageName) {
    _logUniqueEvent(
      uniqueKey: packageName,
      eventName: 'opened_package_$packageName',
    );
  }

  void logOpenedLiveDemo(String demoName) {
    _logUniqueEvent(
      uniqueKey: demoName,
      eventName: 'opened_demo_$demoName',
    );
  }

  void logOpenedSaasWebsite(String saasName) {
    _logUniqueEvent(
      uniqueKey: 'saas_website_$saasName',
      eventName: 'opened_saas_website_$saasName',
    );
  }

  void logOpenedSaasRepository(String saasName) {
    _logUniqueEvent(
      uniqueKey: 'saas_repo_$saasName',
      eventName: 'opened_saas_repository_$saasName',
    );
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
    _logUniqueEvent(
      uniqueKey: 'repositoryOpened',
      eventName: 'opened_site_repository',
    );
  }
}
