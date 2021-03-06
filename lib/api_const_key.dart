import 'package:amap_flutter_base/amap_flutter_base.dart';

/// Stores constant, secret and access key related to external API
abstract class ApiConstKey {
  // static const String amapAndroidApiKey = "f9648f64a9a370e7dc8e09c63ac2cbc1";
  static const String amapAndroidApiKey = "1493783ababea2a70a04645c92b1aec7";
  static const String amapIosApiKey = "c166816f949c6c796c329e0c62968d34";
  static const AMapPrivacyStatement amapPrivacyStatement =
      AMapPrivacyStatement(hasContains: true, hasShow: true, hasAgree: true);

  static const String apiDomain = String.fromEnvironment("WHOSHERE_API_DOMAIN",
      defaultValue: "whoshere.fuiyoo.tech");

  /// The api port number, default value is 0 (this value will not be used)
  static const int apiPort = int.fromEnvironment("WHOSHERE_API_PORT");
  static const String apiPath =
      String.fromEnvironment("WHOSHERE_API_BASE", defaultValue: "");

  static const bool useSecureContext =
      bool.fromEnvironment("WHOSHERE_API_SECURE_CONTEXT", defaultValue: true);
}
