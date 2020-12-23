import 'dart:io' show Platform;

//import 'package:connectivity/connectivity.dart';

bool get isIos => Platform.isIOS;
bool get isAndroid => Platform.isAndroid;
bool get isMacos => Platform.isMacOS;

class Utils {
  static String getUrlParams(Map<String, dynamic> params) {
    return params.entries.map((e) => '${e.key}=${e.value}').join('&');
  }

  //static Future<bool> get appIsOnline
  //=> Connectivity().checkConnectivity().then((value) => value)
}
