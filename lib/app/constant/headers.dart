// ignore_for_file: constant_identifier_names

class AppHeaders {
  AppHeaders._();

  static const Map<String, dynamic> headers = {
    'Accept': 'application/json',
  };

  static Map<String, dynamic> header() {
    return {
      'Accept': 'application/json',
    };
  }

  static Map<String, dynamic> authHeader(String token) {
    return {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
  }

  static Map<String, dynamic> langHeader(String lang) {
    return {
      'x-localization': lang,
      'Accept': 'application/json',
    };
  }

  static Map<String, dynamic> authLangHeader(String token, String lang) {
    return {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
      'x-localization': lang,
    };
  }
}
