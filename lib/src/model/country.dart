

class Country {
  String name;
  String countryCode;

  Country({
    required this.name,
    required this.countryCode
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json.containsKey("name") ? json['name'] : "",
      countryCode: json.containsKey("country_code") ? json['country_code'] : ""
    );
  }
}