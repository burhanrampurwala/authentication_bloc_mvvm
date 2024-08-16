class AppEnvironmentVariables {
  static const baseURL = "base-url";
  static const appName = "app-name";
  static const debugBannerBoolean = "debug-banner-boolean";

  static Map<String, dynamic> dev = {
    baseURL: "",
    appName: 'Authentication Bloc MVVM Dev',
    debugBannerBoolean: true,

  };
  static Map<String, dynamic> prod = {
    baseURL: "",
    appName: 'Authentication Bloc MVVM Prod',
    debugBannerBoolean: false,
  };
}
