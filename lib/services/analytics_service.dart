class AnalyticsService {
  static AnalyticsService? _instance;
  AnalyticsService._();
  static AnalyticsService get instance => _instance ??= AnalyticsService._();

  final Set<String> _alreadyLogged = <String>{};

  void _logUniqueEvent(String uniqueKey) {
    _alreadyLogged.add(uniqueKey);
  }

  void logContact(String contactName) {
    _logUniqueEvent('contact_$contactName');
  }

  void logOpenedPackage(String packageName) {
    _logUniqueEvent('package_$packageName');
  }

  void logOpenedLiveDemo(String demoName) {
    _logUniqueEvent('demo_$demoName');
  }

  void logOpenedSaasWebsite(String saasName) {
    _logUniqueEvent('saas_website_$saasName');
  }

  void logOpenedSaasRepository(String saasName) {
    _logUniqueEvent('saas_repository_$saasName');
  }

  void logOpenedPublishedAppStore(String appName, String platform) {
    _logUniqueEvent('published_app_${appName}_$platform');
  }

  void usedChangeColorFeature(String demoName) {
    _logUniqueEvent('change_color_$demoName');
  }

  void usedChangeLightningFeature(String demoName) {
    _logUniqueEvent('change_lightning_$demoName');
  }

  void openedSiteRepository() {
    _logUniqueEvent('site_repository');
  }
}
