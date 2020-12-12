import 'package:flutter/foundation.dart' as foundation;

bool get isIos =>
    foundation.defaultTargetPlatform == foundation.TargetPlatform.iOS;
bool get isAndroid =>
    foundation.defaultTargetPlatform == foundation.TargetPlatform.android;

class Utils {
  static String getUrlParams(Map<String, dynamic> params) {
    return params.entries.map((e) => "${e.key}=${e.value}").join("&");
  }
}
