import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class BaseAPIService {

  Map<String, String> getDefaultHeader() {
    var header = <String, String>{};
    header["authorization"] = "";
    header["localized"] = "th";
    return header;
  }

  void responseValidation(http.Response response) {
    switch (response.statusCode) {
      case 200:
        if (kDebugMode) {
          print("Success: ${response.body}");
        }
        break;
      case 400:
        throw Exception("Bad Request: ${response.body}");
      case 401:
        throw Exception("Unauthorized: ${response.body}");
      case 403:
        throw Exception("Forbidden: ${response.body}");
      case 404:
        throw Exception("Not Found");
      case 500:
        throw Exception("Server Error");
      default:
        throw Exception("Unknown Error: ${response.statusCode}");
    }
  }

}