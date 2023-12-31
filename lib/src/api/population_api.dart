

import 'package:http/http.dart' as http;

Future<int> getPopulationForCity({
  required String name,
  required String countryCode
}) async {
  try {
    http.Response response = await http.get(
      Uri.parse(
        "https://api.api-ninjas.com/v1/city?name=${Uri.encodeComponent(name)}&country_code=${countryCode.toUpperCase()}"
      ),
      headers: {
        "X-Api-Key": "yUsp8J639dPFPutvLfR95w==QvWrmLLncYkFrPbo"
      }
    );
    print("start request");
    print(response.body);

    // TODO MOVE ALL THE API REQUESTS TO THE BACKEND the front should have only one request to the backend

    // response.body is 
    // [{"name": "Paris", "latitude": 48.8566, "longitude": 2.3522, "country": "FR", "population": 11020000, "is_capital": true}]
    print("end request");
    if (response.statusCode == 200) {
      return 0;
    }
  } catch (e) {
    print(e);
  }

  return 0;
} 