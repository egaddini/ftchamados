// ignore_for_file: constant_identifier_names

enum Environments {
  PRODUCTION,
  QAS,
  DEV,
  LOCAL;
}

class ConfigEnvironments {
  static Environments currentEnvironments = Environments.LOCAL;

  static final List<Map<String, String>> _availableEnvironments = [
    {
      'env': Environments.LOCAL.name,
      'url': 'http://localhost:8080/api/',
    },
    {
      'env': Environments.DEV.name,
      'url': '',
    },
    {
      'env': Environments.QAS.name,
      'url': '',
    },
    {
      'env': Environments.PRODUCTION.name,
      'url': '',
    },
  ];

  static Map<String, String> getEnvironments() {
    return _availableEnvironments.firstWhere(
      (d) => d['env'] == currentEnvironments.name,
    );
  }
}
