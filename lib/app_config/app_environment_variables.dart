class AppEnvironmentVariables {
  static const appName = "app-name";
  static const debugBannerBoolean = "debug-banner-boolean";

  static Map<String, dynamic> dev = {
    appName: 'Authentication Bloc MVVM Dev',
    debugBannerBoolean: true,

  };
  static Map<String, dynamic> prod = {
    appName: 'Authentication Bloc MVVM Prod',
    debugBannerBoolean: false,
  };
}
