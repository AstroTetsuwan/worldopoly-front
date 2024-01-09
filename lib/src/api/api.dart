import 'package:http/http.dart' as http;
import "dart:convert" as convert;
import 'package:worldopoly/src/constants/config.dart';

class WorldopolyAPI {
  static Future<Map<String, dynamic>?> get ({
    required String path,
    Map<String, dynamic>? params
  }) async {
    String url = "${getConfig()['API_URL']}/$path";
    if (params != null) {
      url += "?";
      params.forEach((key, value) => url += "$key=$value&");
    }
    try {
      http.Response response = await http.get(Uri.parse(url));
      return convert.jsonDecode(response.body);
    } catch (e) {
      print("Error: $e");
      // TODO throw exception ?
      return null;
    }
  }
}