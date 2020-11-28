class Utils {
  static String getUrlParams(Map<String, dynamic> params) {
    return params.entries.map((e) => "${e.key}=${e.value}").join("&");
  }
}
