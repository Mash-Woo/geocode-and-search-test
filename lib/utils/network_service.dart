import 'dart:developer';

import 'package:http/http.dart' as http;

class NetWorkService {
  static Future<http.Response> post(String url) async {
   var response = await http.post(
      Uri.parse(url),
    );
    if (response.statusCode == 401){
      log('Response Error ${response.reasonPhrase}');
    }
    return response;
  }

  static Future<http.Response> get(String url) async {
    var response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 401){
      log('Response Error ${response.reasonPhrase}');
    }
    return response;
  }
}
