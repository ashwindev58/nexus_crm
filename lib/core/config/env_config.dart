enum AppEnvironment { dev, staging, prod }

class EnvConfig {
  final AppEnvironment environment;
  final String apiBaseUrl;
  final String appTitle;
  final bool showDebugBadge;

  static late EnvConfig instance;

  EnvConfig._({
    required this.environment,
    required this.apiBaseUrl,
    required this.appTitle,
    required this.showDebugBadge,
  });

  static void initialize(AppEnvironment env) {
    switch (env) {
      case AppEnvironment.dev:
        instance = EnvConfig._(
          environment: AppEnvironment.dev,
          apiBaseUrl: 'https://jsonplaceholder.typicode.com',
          appTitle: 'Nexus CRM [DEV]',
          showDebugBadge: true,
        );
        break;
      case AppEnvironment.staging:
        instance = EnvConfig._(
          environment: AppEnvironment.staging,
          apiBaseUrl: 'https://jsonplaceholder.typicode.com',
          appTitle: 'Nexus CRM [STAGING]',
          showDebugBadge: true,
        );
        break;
      case AppEnvironment.prod:
        instance = EnvConfig._(
          environment: AppEnvironment.prod,
          apiBaseUrl: 'https://jsonplaceholder.typicode.com',
          appTitle: 'Nexus CRM',
          showDebugBadge: false,
        );
        break;
    }
  }
}
