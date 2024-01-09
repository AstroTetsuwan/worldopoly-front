
import 'package:worldopoly/src/model/country.dart';

class City {
  final String name;
  final String state;
  final String region;
  final String postcode;
  final Country country;
  final String countryCode;
  final bool isCapital;

  City({
    required this.name,
    required this.state,
    required this.region,
    required this.postcode,
    required this.country,
    required this.countryCode,
    this.isCapital = false
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      name: json.containsKey("name") ? json['name'] : json.containsKey("city") ? json['city'] : "",
      state: json.containsKey("state") ? json['state'] : "",
      region: json.containsKey("region") ? json['region'] : "",
      postcode: json.containsKey("postcode") ? json['postcode'] : "",
      country: Country.fromJson(json['country']),
      countryCode: json.containsKey("country_code") ? json['country_code'] : "",
      isCapital: json.containsKey("is_capital") ? json['is_capital'] : false
    );
  }

  @override
  String toString() {
    return 'City{name: $name, state: $state, region: $region, postcode: $postcode, country: $country}';
  }
}